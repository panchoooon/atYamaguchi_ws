//--------------------------------------------------
//PCLマッチング学習用PCDファイル生成ノード
//
//author: Yuichiro TANAKA
//
//memo:
//
//--------------------------------------------------

#include <ros/ros.h>

#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>

#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/passthrough.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/kdtree/kdtree.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/io/pcd_io.h>

#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

#include <iostream>
#include <vector>

#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>


// PCD出力先
const char* OUTPUTPATH = "/home/yuichirotanaka15/usr";


class CreateTemplate{
private:
    ros::NodeHandle nh_;
    ros::Subscriber sub_pt_;
    ros::Publisher  pub_pt0_, pub_pt1_;
    sensor_msgs::PointCloud2 sm_pc2_;
    
    tf::TransformListener *tf_listener_;
    
    cv::Mat *tmpimg_;
    int num_savefile_;
    
public:
    CreateTemplate(){
        sub_pt_  = nh_.subscribe("/camera/depth_registered/points", 1, &CreateTemplate::subFuncSave, this);
        pub_pt0_ = nh_.advertise<sensor_msgs::PointCloud2>("/obj/pt0", 1);
        pub_pt1_ = nh_.advertise<sensor_msgs::PointCloud2>("/obj/pt1", 1);
        
        tf_listener_ = new tf::TransformListener();
        
        tmpimg_ = new cv::Mat(cv::Size(320, 240), CV_8UC3, cv::Scalar(0, 0, 255));
        num_savefile_ = 0;
    }
    
    ~CreateTemplate(){
    }
    
    void subFuncSave(const sensor_msgs::PointCloud2ConstPtr &in_cloud_const_ptr){
        
        pcl::PointCloud<pcl::PointXYZRGBA> in_cloud;
        pcl::fromROSMsg(*in_cloud_const_ptr, in_cloud);
        pcl::PointCloud<pcl::PointXYZRGBA>::Ptr in_cloud_ptr (new pcl::PointCloud<pcl::PointXYZRGBA>(in_cloud));
                
        // for visualization
        pcl::PointCloud<pcl::PointXYZRGBA>::Ptr proc0_cloud_ptr(new pcl::PointCloud<pcl::PointXYZRGBA>);
        pcl::PointCloud<pcl::PointXYZRGBA>::Ptr proc1_cloud_ptr(new pcl::PointCloud<pcl::PointXYZRGBA>);
        
        // keep & publish entire cloud
        pcl::copyPointCloud<pcl::PointXYZRGBA, pcl::PointXYZRGBA>(*in_cloud_ptr, *proc0_cloud_ptr);
        pcl::toROSMsg(*proc0_cloud_ptr, sm_pc2_);
        sm_pc2_.header.frame_id = "/camera_depth_optical_frame";
        pub_pt0_.publish(sm_pc2_);
        
        //ROS_INFO("before pass through: %d", in_cloud_ptr->isOrganized());
        
        // pass through
        pcl::PassThrough<pcl::PointXYZRGBA> pth;
        pth.setInputCloud(in_cloud_ptr);
        pth.setFilterFieldName("x");
        pth.setFilterLimits(-0.25, 0.25);
        pth.setFilterLimitsNegative(false);
        pth.filter(*in_cloud_ptr);
        pth.setInputCloud(in_cloud_ptr);
        pth.setFilterFieldName("y");
        pth.setFilterLimits(-0.25, 0.5);
        pth.setFilterLimitsNegative(false);
        pth.filter(*in_cloud_ptr);
        pth.setInputCloud(in_cloud_ptr);
        pth.setFilterFieldName("z");
        pth.setFilterLimits(0.5, 1.25);
        pth.setFilterLimitsNegative(false);
        pth.filter(*in_cloud_ptr);       

        //ROS_INFO("After pass through: %d", in_cloud_ptr->isOrganized());

        // plane detection
        pcl::ModelCoefficients::Ptr plane_coef(new pcl::ModelCoefficients);
        pcl::PointIndices::Ptr plane_indices(new pcl::PointIndices);
        pcl::SACSegmentation<pcl::PointXYZRGBA> sac_seg;
        sac_seg.setModelType(pcl::SACMODEL_PLANE);
        sac_seg.setMethodType(pcl::SAC_RANSAC);
        sac_seg.setDistanceThreshold(0.01);
        sac_seg.setOptimizeCoefficients(true);
        sac_seg.setInputCloud(in_cloud_ptr);
        sac_seg.segment(*plane_indices, *plane_coef);
        if (plane_indices->indices.size() < 100){
            ROS_INFO("There is no plane.");
            return;
        }
        
        // plane extraction
        pcl::ExtractIndices<pcl::PointXYZRGBA> ext;
        ext.setInputCloud(in_cloud_ptr);
        ext.setIndices(plane_indices);
        ext.setNegative(true);
        ext.filter(*in_cloud_ptr);
        
        // keep & publish object cloud
        pcl::copyPointCloud<pcl::PointXYZRGBA, pcl::PointXYZRGBA>(*in_cloud_ptr, *proc1_cloud_ptr);
        pcl::toROSMsg(*proc1_cloud_ptr, sm_pc2_);
        sm_pc2_.header.frame_id = "/camera_depth_optical_frame";
        pub_pt1_.publish(sm_pc2_);
        
        // save object cloud
        cv::imshow("type 1 to save.", *tmpimg_);
        int key = cv::waitKey(30);
        if (key == 49){
            ROS_INFO("save:%d", num_savefile_);
            char str_ent[100];
            char str_obj[100];
            snprintf(str_ent, 100, "%s/ent_%d.pcd", OUTPUTPATH, num_savefile_);
            snprintf(str_obj, 100, "%s/obj_%d.pcd", OUTPUTPATH, num_savefile_);
            pcl::io::savePCDFileBinary(str_ent, *proc0_cloud_ptr);
            pcl::io::savePCDFileBinary(str_obj, *proc1_cloud_ptr);
            num_savefile_ ++;
        }
        else if (key == 48){
            ROS_INFO("exit");
            exit(1);
        }
    }
};


int main(int argc, char** argv){
    ros::init(argc, argv, "create_template_pcd");

    CreateTemplate CreateTemplate;

    while(ros::ok()){
        ros::spinOnce();
    }
    
    return 0;
}
