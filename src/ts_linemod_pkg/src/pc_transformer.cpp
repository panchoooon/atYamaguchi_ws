//--------------------------------------------------
//ポイントクラウド座標変換ROSノード
//
//author: Yuichiro TANAKA
//
//memo:
//PCLマッチングノードと組み合わせて使う
//--------------------------------------------------

#include <ros/ros.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

class PCTransformer{
private:
    ros::NodeHandle nh_;
    ros::Subscriber sub_pcl_;
    ros::Publisher  pub_res_;
    tf::TransformListener *tf_listener_;
    
public:
    PCTransformer(
    ){
        sub_pcl_ = nh_.subscribe("/dtc/pt", 1, &PCTransformer::subFuncConvert, this);
        pub_res_ = nh_.advertise<sensor_msgs::PointCloud2>("/dtc/pt_tf", 1);
        tf_listener_ = new tf::TransformListener();
    }
    
    void subFuncConvert(
        const sensor_msgs::PointCloud2ConstPtr &input_smpc2cp
    ){
        sensor_msgs::PointCloud input_smpc;
        sensor_msgs::convertPointCloud2ToPointCloud(*input_smpc2cp, input_smpc);
        sensor_msgs::PointCloud base_smpc;
        try{
            tf_listener_->transformPointCloud("base_footprint", ros::Time(0), input_smpc, "/camera_link", base_smpc);
        }
        catch(tf::TransformException& ex){
            ROS_INFO("Transform FAIL");
            ros::Duration(1).sleep();
            return;
        }
        sensor_msgs::PointCloud2 base_smpc2;
        sensor_msgs::convertPointCloudToPointCloud2(base_smpc, base_smpc2);
        base_smpc2.header.frame_id = "base_footprint";
        pub_res_.publish(base_smpc2);    

        return;
    }    
};

int main(int argc, char **argv){
    ros::init(argc, argv, "pc_transformer");
    
    PCTransformer PCTransformer;
    
    while(ros::ok()){
        ros::spinOnce();
    }

    return 0;
}
