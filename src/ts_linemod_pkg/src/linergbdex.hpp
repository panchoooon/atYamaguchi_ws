//--------------------------------------------------
//LineRGBDに保存機能を追加したクラス
//
//author: Yuichiro TANAKA
//
//memo:
//
//--------------------------------------------------

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/recognition/linemod.h>
#include <pcl/recognition/linemod/line_rgbd.h>

#include <fstream>
#include <iostream>
#include <sys/stat.h>

class LineRGBDEX : public pcl::LineRGBD<pcl::PointXYZRGBA> {
public:
    // 学習済みLineRGBDを保存する関数
    // hogehoge.linemod
    // hogehoge.objectid
    // hogehoge.bouding
    // の3つのファイルが出力される
    void saveLineRGBD(std::string filename){
    
        // linemodファイルの出力
        std::string linemod_filename = filename + ".linemod";
        std::ofstream linemod_file;
        linemod_file.open(linemod_filename.c_str(), std::ofstream::out | std::ofstream::binary);
        linemod_.serialize(linemod_file);
        linemod_file.close();
        
        // objectidファイルの出力
        std::string objectid_filename = filename + ".objectid";
        std::ofstream objectid_file(objectid_filename.c_str());
        for (size_t sz = 0; sz < object_ids_.size(); sz++){
            objectid_file << object_ids_[sz] << std::endl;
        }
        objectid_file.close();
        
        // boudingファイルの出力
        std::string bounding_filename = filename + ".bounding";
        std::ofstream bounding_file(bounding_filename.c_str());
        for (size_t sz = 0; sz < bounding_boxes_.size(); sz++){
            bounding_file << bounding_boxes_[sz].x << std::endl;
            bounding_file << bounding_boxes_[sz].y << std::endl;
            bounding_file << bounding_boxes_[sz].z << std::endl;
            bounding_file << bounding_boxes_[sz].width  << std::endl;
            bounding_file << bounding_boxes_[sz].height << std::endl;
            bounding_file << bounding_boxes_[sz].depth  << std::endl;
        }
        bounding_file.close();
        
        return;
    }
    
    // save_linergbd()によって出力したファイル群を読み込んで
    // 学習済みLineRGBDを再現する関数
    void loadLineRGBD(std::string filename){
        struct stat st;
    
        // linemodファイルの有無の確認
        std::string linemod_filename = filename + ".linemod";
        if (stat(linemod_filename.c_str(), &st) != 0){
            ROS_INFO("Could not find file");
            exit(1);
        }
        // linemodファイルの読み込み
        std::ifstream linemod_file;
        linemod_file.open(linemod_filename.c_str(), std::ifstream::in);
        linemod_.deserialize(linemod_file);
        linemod_file.close();
        
        // objectidファイルの有無の確認
        std::string objectid_filename = filename + ".objectid";
        if (stat(objectid_filename.c_str(), &st) != 0){
            ROS_INFO("Could not find file");
            exit(1);
        }
        // objectidファイルの読み込み
        std::ifstream objectid_file(objectid_filename.c_str());
        std::string buf_objectid;
        while(objectid_file && getline(objectid_file, buf_objectid)) {
            object_ids_.push_back(std::atoi(buf_objectid.c_str()));       
        }
        
        // boundingファイルの有無の確認
        std::string bounding_filename = filename + ".bounding";
        if (stat(bounding_filename.c_str(), &st) != 0){
            ROS_INFO("Could not find file");
            exit(1);
        }
        // boundingファイルの読み込み
        std::ifstream bounding_file(bounding_filename.c_str());
        std::string buf_bounding;
        int j = 0;
        pcl::BoundingBoxXYZ bb;
        while(bounding_file && getline(bounding_file, buf_bounding)) {
            if (j == 0){
                bb.x      = std::atof(buf_bounding.c_str());
                j++;
            }
            else if (j == 1){
                bb.y      = std::atof(buf_bounding.c_str());
                j++;
            }
            else if (j == 2){
                bb.z      = std::atof(buf_bounding.c_str());
                j++;
            }
            else if (j == 3){
                bb.width  = std::atof(buf_bounding.c_str());
                j++;
            }
            else if (j == 4){
                bb.height = std::atof(buf_bounding.c_str());
                j++;
            }
            else if (j == 5){
                bb.depth  = std::atof(buf_bounding.c_str());
                bounding_boxes_.push_back(bb);
                j = 0;
            }         
        }
        return;
    }
};
