//--------------------------------------------------
//PCLマッチング(LINEMOD)ROSノード
//
//author: Yuichiro TANAKA
//
//memo:
//
//--------------------------------------------------

#include <ros/ros.h>

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/io/pcd_io.h>                              // new

#include <pcl/recognition/linemod.h>                    // new
#include <pcl/recognition/linemod/line_rgbd.h>          // new
#include <pcl/recognition/mask_map.h>                   // new
#include <pcl/recognition/region_xy.h>                  // new
#include <pcl/recognition/color_gradient_modality.h>    // new
#include <pcl/recognition/surface_normal_modality.h>    // new

#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>

#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

#include <string>
#include <vector>

#include "linergbdex.hpp"                               // new

///////////////////////////////////////////////////////////////////////////////////////////////////

// 学習用PCDファイルのパラメータ
/*
const int  OBJECT_SIZE   = 10;  // オブジェクトのカテゴリ数
const int  OBJECT_NUMBER = 10;  // オブジェクトごとのPCDファイルの数
const char OBJECT_NAME[OBJECT_SIZE][20] = {
    "1_green_tea",
    "2_cafe_au_lait",
    "3_iced_tea",
    "4_orange_juice",
    "5_strawberry_juice",
    "6_cookie",
    "7_potato_chips",
    "8_potato_stick",
    "9_egg_soup",
    "10_potage_soup"
};
*/
const int  OBJECT_SIZE   = 1;   // オブジェクトのカテゴリ数
const int  OBJECT_NUMBER = 10;  // オブジェクトごとのPCDファイルの数
const char OBJECT_NAME[OBJECT_SIZE][20] = {
    "1_green_tea"
};
const char* PCDFILEPATH = "/home/yuichirotanaka15/usr/pcd_db170617";

// 学習済みファイル出力名
const char* OUTPUTPATH  = "template";

// 検出のパラメータ
const double MAGNITUDE_THRESHOLD = 10.0;
const double DETECTION_THRESHOLD = 0.91;

// パススルーフィルターのパラメータ（camera_depth_optical_frame系）
const double PTX_MIN = -0.5;
const double PTX_MAX =  0.5;
const double PTY_MIN = -0.5;
const double PTY_MAX =  0.5;
const double PTZ_MIN =  0.5;
const double PTZ_MAX =  1.0;

///////////////////////////////////////////////////////////////////////////////////////////////////

// 本体
class PCLMatching{
private:
    LineRGBDEX line_rgbd_;              // LineRGBDEX クラスのインスタンスの生成
    
    ros::NodeHandle nh_;
    ros::Publisher  pub_res_;           // 処理結果パブリッシュ用
    ros::Subscriber sub_pcl_;           // 入力用ポイントクラウドサブスクライブ用
    sensor_msgs::PointCloud2 sm_pc2_;

    // メソッド：テンプレート追加
    void trainTemplate(
        pcl::PointCloud<pcl::PointXYZRGBA>::Ptr &entire,
        pcl::PointCloud<pcl::PointXYZRGBA>::Ptr &object,
        int object_id
    ){  
        this->line_rgbd_.setInputCloud (entire);
        this->line_rgbd_.setInputColors(entire);

        float obj_minx =  10000.0;
        float obj_maxx = -10000.0;
        float obj_miny =  10000.0;
        float obj_maxy = -10000.0;
        float obj_minz =  10000.0;
        float obj_maxz = -10000.0;
        for (size_t sz = 0; sz < object->points.size(); sz++){
            obj_minx = std::min(obj_minx, object->points[sz].x);
            obj_maxx = std::max(obj_maxx, object->points[sz].x);
            obj_miny = std::min(obj_miny, object->points[sz].y);
            obj_maxy = std::max(obj_maxy, object->points[sz].y);
            obj_minz = std::min(obj_minz, object->points[sz].z);
            obj_maxz = std::max(obj_maxz, object->points[sz].z);
        }
            
        pcl::MaskMap mask(entire->width, entire->height);
        size_t minx(entire->width), miny(entire->height), maxx(0), maxy(0);
        for (size_t h = 0; h < entire->height; h++){
            for (size_t w = 0; w < entire->width; w++){
                pcl::PointXYZRGBA p = entire->points[h * entire->width + w];
                if (p.x > obj_minx && p.x < obj_maxx && p.y > obj_miny && p.y < obj_maxy && p.z > obj_minz && p.z < obj_maxz) {
                    mask(w, h) = true;
                    minx = std::min(minx, w);
                    miny = std::min(miny, h);
                    maxx = std::max(maxx, w);
                    maxy = std::max(maxy, h);
                }else{
                    mask(w, h) = false;
                }
            }
        }
       
        pcl::RegionXY region;
        region.x      = static_cast<int> (minx);
        region.y      = static_cast<int> (miny);
        region.width  = static_cast<int> (maxx - minx + 1);
        region.height = static_cast<int> (maxy - miny + 1);
        
        this->line_rgbd_.createAndAddTemplate(*object, (size_t)object_id, mask, mask, region);
        return;
    }
    
    // メソッド：検出
    std::vector<pcl::LineRGBD<pcl::PointXYZRGBA>::Detection> detectTemplate(
        pcl::PointCloud<pcl::PointXYZRGBA>::Ptr &cloud
    ){
        this->line_rgbd_.setGradientMagnitudeThreshold(MAGNITUDE_THRESHOLD);
        this->line_rgbd_.setDetectionThreshold(DETECTION_THRESHOLD);
        this->line_rgbd_.setInputCloud(cloud);
        this->line_rgbd_.setInputColors(cloud);

        std::vector<pcl::LineRGBD<pcl::PointXYZRGBA>::Detection> detections;
        this->line_rgbd_.detect(detections);
        
        return detections;
    }
    
public:
    // コンストラクタ
    PCLMatching(const char* option){
        // 入出力インターフェース
        this->pub_res_ = this->nh_.advertise<sensor_msgs::PointCloud2>("/dtc/pt", 1);
        this->sub_pcl_ = this->nh_.subscribe("/camera/depth_registered/points", 1, &PCLMatching::subFuncDetection, this);

        // 学習あり（学習済みファイル保存）
        if (!strcmp(option, "train")){
            ROS_INFO("start train: %s", PCDFILEPATH);
            
            for (int obj = 0; obj < OBJECT_SIZE; obj++) {
                for (int num = 0; num < OBJECT_NUMBER; num++) {
                    char str_ent_cld[100];
                    char str_obj_cld[100];
                    snprintf(str_ent_cld, 100, "%s/%s/ent_%d.pcd", PCDFILEPATH, OBJECT_NAME[obj], num);
                    snprintf(str_obj_cld, 100, "%s/%s/obj_%d.pcd", PCDFILEPATH, OBJECT_NAME[obj], num);
                    
                    pcl::PointCloud<pcl::PointXYZRGBA>::Ptr ent_cld(new pcl::PointCloud<pcl::PointXYZRGBA>);
                    pcl::PointCloud<pcl::PointXYZRGBA>::Ptr obj_cld(new pcl::PointCloud<pcl::PointXYZRGBA>);
                    if (pcl::io::loadPCDFile<pcl::PointXYZRGBA>(str_ent_cld, *ent_cld) == -1){
                        ROS_INFO("\x1b[33mWARNING: Could not load PCD file");
                        ROS_INFO("\x1b[33mWARNING: But continue to load");
                        continue;
                    }
                    if (pcl::io::loadPCDFile<pcl::PointXYZRGBA>(str_obj_cld, *obj_cld) == -1){
                        ROS_INFO("\x1b[33mWARNING: Could not load PCD file");
                        ROS_INFO("\x1b[33mWARNING: But continue to load");
                        continue;
                    }
                    
                    ROS_INFO("train %d of %s", num, OBJECT_NAME[obj]);
                    this->trainTemplate(ent_cld, obj_cld, obj);
                }
            }
            
            ROS_INFO("start saving trained files");
            this->line_rgbd_.saveLineRGBD(OUTPUTPATH);
            ROS_INFO("done saving");
            
            return;
        }
        
        // 学習なし（学習済みファイル読込）
        ROS_INFO("start loading trained files");
        this->line_rgbd_.loadLineRGBD(OUTPUTPATH);
        ROS_INFO("done loading");
            
        return;
    }
    
    // デストラクタ
    ~PCLMatching(){}
    
    // 検出ラッパー
    void subFuncDetection(
        const sensor_msgs::PointCloud2ConstPtr &in_cloud_const_ptr
        ){
        // tfの変換なしのポイントクラウド（organized）
        pcl::PointCloud<pcl::PointXYZRGBA> in_cloud;
        pcl::fromROSMsg(*in_cloud_const_ptr, in_cloud);
        pcl::PointCloud<pcl::PointXYZRGBA>::Ptr in_cloud_ptr (new pcl::PointCloud<pcl::PointXYZRGBA>(in_cloud));
        
        // なんちゃってパススルーフィルター（黒くするだけ）
        for (int i = 0; i < in_cloud_ptr->size(); i++){
            pcl::PointXYZRGBA p = in_cloud_ptr->points[i];
            if (!(p.x > PTX_MIN && p.x < PTX_MAX && p.y > PTY_MIN && p.y < PTY_MAX && p.z > PTZ_MIN && p.z < PTZ_MAX)){
                in_cloud_ptr->points[i].r = 0;
                in_cloud_ptr->points[i].g = 0;
                in_cloud_ptr->points[i].b = 0;
            }
        }
        
        // 検出開始
        ROS_INFO("start detect()");
        std::vector<pcl::LineRGBD<pcl::PointXYZRGBA>::Detection> detections;
        detections = this->detectTemplate(in_cloud_ptr);
        
        // 検出できなかった場合
        if (detections.size() == 0){
            ROS_INFO("No detection");
            
            // 未処理点群をパブリッシュする
            pcl::toROSMsg(*in_cloud_ptr, sm_pc2_);
            sm_pc2_.header.frame_id = "/camera_depth_optical_frame";
            pub_res_.publish(sm_pc2_);
            return;
        }
        
        // 最も一致度が高かったものを選ぶ
        int    max_id       = 0;
        double max_response = 0.0;
        for (int i = 0; i < detections.size(); i++){
            if (detections[i].response > max_response){
                max_id = i;
                max_response = detections[i].response;
            }
        }
        
        // 最も一致度が高かった検出結果を出力する
        pcl::BoundingBoxXYZ &bb = detections[max_id].bounding_box;
        ROS_INFO("id:%d",  (int)detections[max_id].object_id);
        ROS_INFO("res:%f", detections[max_id].response);
        ROS_INFO("x :%f",  bb.x);
        ROS_INFO("y :%f",  bb.y);
        ROS_INFO("z :%f",  bb.z);

        // 最も一致度が高かった点群だけ赤く塗りつぶす
        for (size_t sz = 0; sz < in_cloud_ptr->points.size(); sz++){
            pcl::PointXYZRGBA p = in_cloud_ptr->points[sz];
            if (p.x > bb.x && p.x < bb.x + bb.depth && p.y > bb.y && p.y < bb.y + bb.height && p.z > bb.z && p.z < bb.z + bb.width){
                in_cloud_ptr->points[sz].r = 255;
                in_cloud_ptr->points[sz].g = 0;
                in_cloud_ptr->points[sz].b = 0;
            }
        }

        // 塗りつぶした点群をパブリッシュする
        pcl::toROSMsg(*in_cloud_ptr, sm_pc2_);
        sm_pc2_.header.frame_id = "/camera_depth_optical_frame";
        pub_res_.publish(sm_pc2_);
        
        return;
    }
};


int main(int argc, char **argv){
    ros::init(argc, argv, "linergbd_node");

    // 実行オプション
    // $ rosrun ts_linemod_pkg linergbd_node <option>
    // <option> = "train"   : 学習+保存+検出
    // <option> = "notrain" : 読込+検出
    const char* option = argv[1];
    
    PCLMatching PCLMatching(option);
    
    while(ros::ok()){
        ros::spinOnce();
    }

    return 0;
}
