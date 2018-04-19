//--------------------------------------------------
//PCDファイルをみるだけ
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
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/visualization/point_cloud_color_handlers.h>
#include <pcl/io/pcd_io.h>

#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>

int main(int argc, char **argv){
    ros::init(argc, argv, "pcd_viewer");
    
    const char* pcd_file = argv[1];
    pcl::PointCloud<pcl::PointXYZRGBA>::Ptr cld(new pcl::PointCloud<pcl::PointXYZRGBA>);
    if (pcl::io::loadPCDFile<pcl::PointXYZRGBA>(pcd_file, *cld) == -1){
        ROS_INFO("Could not load PCD file");
        return -1;
    }
    
    if (cld->isOrganized())
        ROS_INFO("organized");
    else
        ROS_INFO("unorganized");
    
    pcl::visualization::CloudViewer viewer("Viewer");
    viewer.showCloud(cld);
    
    while(ros::ok()){
        ros::spinOnce();
    }
    
    return 0;
}
