//--------------------------------------------------
//
//
//author: Yutaro ISHIDA
//--------------------------------------------------


#include <hsr_common_pkg/common_include.h>
#include <hsr_common_pkg/common_function.h>


//pcl::visualization::CloudViewer viewer("viewer");


//--------------------------------------------------
//メイン関数
//--------------------------------------------------
int main (int argc, char** argv){
    ros::init (argc, argv, "obj_proc");

    vector<char*> name;
    name.push_back("1_green_tea");
    //name.push_back("2_cafe_au_lait");
    //name.push_back("3_iced_tea");
    //name.push_back("4_orange_juice");
    //name.push_back("5_strawberry_juice");
    //name.push_back("6_potato_chips");
    //name.push_back("7_cookie_1");
    //name.push_back("7_cookie_2");
    //name.push_back("7_cookie_3");
    //name.push_back("7_cookie_4");
    //name.push_back("7_cookie_5");
    //name.push_back("7_cookie_6");
    //name.push_back("8_potato_stick");
    //name.push_back("9_potage_soup");
    //name.push_back("10_egg_soup");

    char path_tmp_file[500];
    double ave_temp;
    double sum_r;
    double min_r;

    cv::Mat temp1;
    cv::Mat temp2;
    cv::Mat src1;
    cv::Mat src2;

    //5e+06

    temp1 = cv::imread("/home/athome03/athome_cfg_file/caffe/ihr5/original/high/1_green_tea/0.jpg", 0);

    for(int i = 0; i < name.size(); i++){
        sprintf(path_tmp_file, "/home/athome03/athome_cfg_file/caffe/ihr5/original/high/%s/0.jpg", name[i]);
        src1 = cv::imread(path_tmp_file, 0);

        cv::resize(temp1, temp2, cv::Size(100, 200), CV_INTER_LINEAR);
        cv::resize(src1, src2, cv::Size(100, 200), CV_INTER_LINEAR);

        ave_temp = 0;
        for(int y = 0; y < 200; y++){
            for(int x = 0; x < 100; x++){
                ave_temp += temp2.at<unsigned char>(y, x);
            }
        }
        ave_temp = ave_temp / (200 * 100);

        sum_r = 0;
        for(int y = 0; y < 200; y++){
            for(int x = 0; x < 100; x++){
                sum_r += (temp2.at<unsigned char>(y, x) - ave_temp) * src2.at<unsigned char>(y, x);
            }
        }
        min_r = sum_r;


        for(int j = 1; j < 100; j++){
            sprintf(path_tmp_file, "/home/athome03/athome_cfg_file/caffe/ihr5/original/high/%s/%d.jpg", name[i], j);
            src1 = cv::imread(path_tmp_file, 0);

            cv::resize(temp1, temp2, cv::Size(100, 200), CV_INTER_LINEAR);
            cv::resize(src1, src2, cv::Size(100, 200), CV_INTER_LINEAR);

            ave_temp = 0;
            for(int y = 0; y < 200; y++){
                for(int x = 0; x < 100; x++){
                    ave_temp += temp2.at<unsigned char>(y, x);
                }
            }
            ave_temp = ave_temp / (200 * 100);

            sum_r = 0;
            for(int y = 0; y < 200; y++){
                for(int x = 0; x < 100; x++){
                    sum_r += (temp2.at<unsigned char>(y, x) - ave_temp) * src2.at<unsigned char>(y, x);
                }
            }
            
            if(min_r < sum_r){
                min_r = sum_r;
            }
        }

        if(min_r > 50000000){
            cout << "same obj" << endl;
        }
    }

    while(ros::ok()){
        ros::spinOnce(); 
    }
}
