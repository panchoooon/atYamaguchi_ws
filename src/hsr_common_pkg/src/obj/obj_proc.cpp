//--------------------------------------------------
//オブジェクト処理ROSノード
//
//author: Yutaro ISHIDA
//
//memo:
//obj_validate,obj_rec.pyとセットで使う
//--------------------------------------------------


#include <hsr_common_pkg/common_include.h>
#include <hsr_common_pkg/common_function.h>


//pcl::visualization::CloudViewer viewer("viewer");


//--------------------------------------------------
//定数
//--------------------------------------------------


//--------------------------------------------------
//グローバル変数
//--------------------------------------------------


//--------------------------------------------------
//デバイス設定
//--------------------------------------------------


//--------------------------------------------------
//オブジェクト検出・認識クラス
//--------------------------------------------------
class ObjRec{
private:
    //ROSノードのハンドル
    ros::NodeHandle nh_;

    //パラメータ値格納用変数
    string p_mode_0_; //動作設定: "pre"（準備,データセット生成），"run"（実行，オブジェクト検出・認識）
    string p_mode_1_; //オブジェクト検出設定: "low"（見下ろし型オブジェクト検出），"high"（見上げ型物体検出）
    string p_mode_2_; //オブジェクト検証設定: "none"（無)，"surf"（データセットとSURF特徴量で比較検証）
    string p_mode_3_; //オブジェクト認識設定: "none"（無），"all"（全て），"id"（対象idのオブジェクトのみ）
    double p_aoi_x_min_;
    double p_aoi_x_max_;
    double p_aoi_y_min_;
    double p_aoi_y_max_;
    double p_aoi_z_min_;
    double p_aoi_z_max_;
    double p_plane_height_;
    int p_target_id_;
    //vector<string> p_name_j_;
    //vector<string> p_name_e_;

    image_transport::ImageTransport img_t_;
    image_transport::Subscriber img_t_sub_smi_cam_;
    image_transport::Publisher img_t_pub_smi_obj_;
    image_transport::Publisher img_t_pub_smi_obj_all_;

    ros::Subscriber sub_smpc2_cam_;
    ros::Publisher pub_smpc2_pt_;
    ros::Publisher pub_smpc2_proc_;

    CommonFunction* CommonFunction_;  

    tf::TransformListener *tf_listener_;

    actionlib::SimpleActionClient<hsr_common_pkg::ObjRecAction> obj_rec_action_;

    cv::Mat mat_cam_;

    int cnt_subf_smpc2_cam_; //Point Cloudを何回Subscribeしたかカウント

    cv_bridge::CvImagePtr cv_img_ptr_;
    sensor_msgs::PointCloud2 o_smpc2_;

    char path_dataset_dir_[500]; //データセットディレクトリのパス
    bool flag_o_dataset_; //データセットを出力するか
    int cnt_dataset_;

    //オブジェクト投票用変数
    //同オブジェクト位置でもオブジェクト番号が異なったら、異なるキー番号で保存
    //同オブジェクト番号でもオブジェクト位置が異なったら、異なるキー番号で保存
    //例: 1個目のオブジェクト（キー番号: 0）
    //オブジェクトid obj_pos_[0][0]
    //実際のオブジェクト位置 obj_pos_[0][1] = x[m], obj_pos_[0][2] = y[m], obj_pos_[0][3] = z[m]
    //画像のオブジェクト位置 obj_pos_[0][4] = x_min[pix], obj_pos_[0][5] = x_max[pix], obj_pos_[0][6] = y_min[pix], obj_pos_[0][7] = y_max[pix]
    //投票数 obj_pos_[0][8] = [回]
    vector< vector<float> > obj_pos_;


public:
    //--------------------------------------------------
    //コンストラクタ
    //--------------------------------------------------
    ObjRec():img_t_(nh_), obj_rec_action_("obj_rec_action", true){
        //パラメータ格納用変数の初期化
        p_mode_0_ = "";
        p_mode_1_ = "";
        p_mode_2_ = "";
        p_mode_3_ = "";
        p_aoi_x_min_ = 0.0;
        p_aoi_x_max_ = 0.0;
        p_aoi_y_min_ = 0.0;
        p_aoi_y_max_ = 0.0;
        p_aoi_z_min_ = 0.0;
        p_aoi_z_max_ = 0.0;
        p_plane_height_ = 0.0;
        p_target_id_ = 0;
        //p_name_j_.clear();
        //p_name_e_.clear();

        //パラメータの取得
        nh_.getParam("/param/obj_proc/mode_0", p_mode_0_);
        nh_.getParam("/param/obj_proc/mode_1", p_mode_1_);
        nh_.getParam("/param/obj_proc/mode_2", p_mode_2_);
        nh_.getParam("/param/obj_proc/mode_3", p_mode_3_);
        nh_.getParam("/param/obj_proc/aoi/base_link_x/min", p_aoi_x_min_);
        nh_.getParam("/param/obj_proc/aoi/base_link_x/max", p_aoi_x_max_);
        nh_.getParam("/param/obj_proc/aoi/base_link_y/min", p_aoi_y_min_);
        nh_.getParam("/param/obj_proc/aoi/base_link_y/max", p_aoi_y_max_);   
        nh_.getParam("/param/obj_proc/aoi/base_link_z/min", p_aoi_z_min_);
        nh_.getParam("/param/obj_proc/aoi/base_link_z/max", p_aoi_z_max_);
        nh_.getParam("/param/obj_proc/plane/height", p_plane_height_);
        nh_.getParam("/param/op/obj/rec/target/id", p_target_id_);
        //nh_.getParam("/param/db/cpp/obj/name_j", p_name_j_);
        //nh_.getParam("/param/db/cpp/obj/name_e", p_name_e_);

        //パラメータの表示
        ROS_INFO("/mode_0: %s", p_mode_0_.c_str());
        ROS_INFO("/mode_1: %s", p_mode_1_.c_str());
        ROS_INFO("/mode_2: %s", p_mode_2_.c_str());
        ROS_INFO("/mode_3: %s", p_mode_3_.c_str());
        ROS_INFO("/aoi/base_link_x/min: %f", p_aoi_x_min_);
        ROS_INFO("/aoi/base_link_x/max: %f", p_aoi_x_max_);
        ROS_INFO("/aoi/base_link_y/min: %f", p_aoi_y_min_);
        ROS_INFO("/aoi/base_link_y/max: %f", p_aoi_y_max_);
        ROS_INFO("/aoi/base_link_z/min: %f", p_aoi_z_min_);
        ROS_INFO("/aoi/base_link_z/max: %f", p_aoi_z_max_);
        ROS_INFO("/plane/height: %f", p_plane_height_);

        //パラメータのバリデート
        if(p_mode_0_ != "pre" && p_mode_0_ !="run"){
            ROS_INFO("[obj_proc]: mode_0 FAIL");
            exit(1);
        }
        if(p_mode_1_ != "low" && p_mode_1_ !="high"){
            ROS_INFO("[obj_proc]: mode_1 FAIL");
            exit(1);
        }
        if(p_mode_2_ != "none" && p_mode_2_ !="surf"){
            ROS_INFO("[obj_proc]: mode_2 FAIL");
            exit(1);
        }
        if(p_mode_3_ != "none" && p_mode_3_ != "all" && p_mode_3_ !="id"){
            ROS_INFO("[obj_proc]: mode_3 FAIL");
            exit(1);
        }

        img_t_sub_smi_cam_ = img_t_.subscribe("/hsrb/head_rgbd_sensor/rgb/image_raw", 1, &ObjRec::subf_smi_cam, this);
        img_t_pub_smi_obj_ = img_t_.advertise("/obj_proc/obj", 1);
        img_t_pub_smi_obj_all_ = img_t_.advertise("/obj_proc/obj_all", 1);

        sub_smpc2_cam_ = nh_.subscribe("/hsrb/head_rgbd_sensor/depth_registered/points", 1, &ObjRec::subf_smpc2_cam, this);
        pub_smpc2_pt_ = nh_.advertise<sensor_msgs::PointCloud2>("/obj_proc/smpc2/pt", 1);         
        pub_smpc2_proc_ = nh_.advertise<sensor_msgs::PointCloud2>("/obj_proc/smpc2/proc", 1);

        //CommonFunction_ = new CommonFunction(nh_);    
        if(p_mode_1_ == "low"){
            //姿勢決定
        }
        else if(p_mode_1_ == "high"){
            //姿勢決定        
        }

        tf_listener_ = new tf::TransformListener();

        if(p_mode_0_ == "run" && p_mode_3_ != "none"){
            obj_rec_action_.waitForServer();
        }

        cnt_subf_smpc2_cam_ = 0;

        if(p_mode_0_ == "pre"){
            cv::namedWindow("for_detect_key", CV_WINDOW_AUTOSIZE);

            time_t tt;
            struct tm *tm;
            char datetime[100];

            setlocale(LC_ALL, "jpn");
            time(&tt);
            tm = localtime(&tt);

            strftime(datetime, 100, "%H%M%S", tm);

            snprintf(path_dataset_dir_, 500, "%s/athome_cfg_file/caffe/tmp/%s", getenv("HOME"), datetime);

            mkdir(path_dataset_dir_, 0755);

            flag_o_dataset_ = 0;
            cnt_dataset_ = 0;
        }

        ros::Duration(1).sleep();
    }


    //--------------------------------------------------
    //デストラクタ
    //--------------------------------------------------
    ~ObjRec(){
    }


    //--------------------------------------------------
    //カラーイメージSubscribe関数
    //--------------------------------------------------
    void subf_smi_cam(const sensor_msgs::ImageConstPtr& cam){
        cv_bridge::CvImagePtr cv_img_ptr_;
        cv_img_ptr_ = cv_bridge::toCvCopy(cam, sensor_msgs::image_encodings::BGR8);
        mat_cam_ = cv_img_ptr_->image;
    }


    //--------------------------------------------------
    //ポイントクラウドSubscribe関数
    //--------------------------------------------------
    void subf_smpc2_cam(const sensor_msgs::PointCloud2ConstPtr& cam_smpc2_ptr){ //smpc2_ptr: sensor_msgs::PointCloud2ConstPtr&
        if(p_mode_0_ == "run"){
            if(cnt_subf_smpc2_cam_ > 4){
                if(p_mode_3_ == "none"){
                    //TODO: 検出座標を返す
                    exit(0);
                }
                else if(p_mode_3_ == "all"){
                    vector<double> obj_pos_id;
                    vector<double> obj_pos_x;
                    vector<double> obj_pos_y;
                    vector<double> obj_pos_z;

                    cv::Mat mat_o = mat_cam_;

                    for(size_t i = 0; i < obj_pos_.size(); i++){
                        if(obj_pos_[i][8] >= 2){
                            obj_pos_id.push_back((int)obj_pos_[i][0]);
                            obj_pos_x.push_back(obj_pos_[i][1]);
                            obj_pos_y.push_back(obj_pos_[i][2]);
                            obj_pos_z.push_back(obj_pos_[i][3]);

                            cv::rectangle(mat_o, cv::Point(obj_pos_[i][4], obj_pos_[i][6]), cv::Point(obj_pos_[i][5], obj_pos_[i][7]), cv::Scalar(0, 0, 255), 2, 2);
                            if(obj_pos_[i][6] < mat_o.rows / 2){
                                cv::putText(mat_o, boost::to_string((int)obj_pos_[i][0]), cv::Point(obj_pos_[i][4], obj_pos_[i][7] + 30), cv::FONT_HERSHEY_SIMPLEX, 0.75, cv::Scalar(0, 0, 255), 1, CV_AA);
                            }
                            else{
                                cv::putText(mat_o, boost::to_string((int)obj_pos_[i][0]), cv::Point(obj_pos_[i][4], obj_pos_[i][6] - 10), cv::FONT_HERSHEY_SIMPLEX, 0.75, cv::Scalar(0, 0, 255), 1, CV_AA);
                            }
                        }
                    }

                    nh_.setParam("/param/obj_proc/result/id", obj_pos_id);
                    nh_.setParam("/param/obj_proc/result/x", obj_pos_x);
                    nh_.setParam("/param/obj_proc/result/y", obj_pos_y);
                    nh_.setParam("/param/obj_proc/result/z", obj_pos_z);

                    cv_img_ptr_->image = mat_o;
                    img_t_pub_smi_obj_all_.publish(cv_img_ptr_->toImageMsg());

                    exit(0);
                }
                else if(p_mode_3_ == "id"){
                    exit(1);
                }
            }
            else{
                cnt_subf_smpc2_cam_++;
            }
        }


        //cam_pc_ptrの生成(/head_rgbd_sensor_rgb_frame)
        //sensor_msgs::PointCloud2ConstPtr&からpcl::PointCloud<pcl::PointXYZRGB>::Ptrに変換
        pcl::PointCloud<pcl::PointXYZRGB> cam_pc; //pc: pcl::PointCloud
        pcl::fromROSMsg (*cam_smpc2_ptr, cam_pc);
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr cam_pc_ptr(new pcl::PointCloud<pcl::PointXYZRGB>(cam_pc)); //pc_ptr: pcl::PointCloud::Ptr
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr cam_tmp_pc_ptr(new pcl::PointCloud<pcl::PointXYZRGB>);


        //base_pc_ptrの生成(/base_footprint)
	    sensor_msgs::PointCloud cam_smpc;
	    sensor_msgs::convertPointCloud2ToPointCloud(*cam_smpc2_ptr, cam_smpc);

        sensor_msgs::PointCloud base_smpc;

        try{
            tf_listener_->transformPointCloud("/base_footprint", ros::Time(0), cam_smpc, "/head_rgbd_sensor_rgb_frame", base_smpc);
        }
        catch(tf::TransformException& ex){
		    ROS_INFO("[obj_proc]: Transform point cloud FAIL");
            ros::Duration(1).sleep();
            return;
	    }

        sensor_msgs::PointCloud2 base_smpc2;
	    sensor_msgs::convertPointCloudToPointCloud2(base_smpc, base_smpc2);

        pcl::PointCloud<pcl::PointXYZRGB> base_pc;
        pcl::fromROSMsg (base_smpc2, base_pc);
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr base_pc_ptr(new pcl::PointCloud<pcl::PointXYZRGB>(base_pc));


        pcl::PointCloud<pcl::PointXYZRGB>::Ptr pt_pc_ptr(new pcl::PointCloud<pcl::PointXYZRGB>);
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr proc_pc_ptr(new pcl::PointCloud<pcl::PointXYZRGB>);
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr obj_pc_ptr(new pcl::PointCloud<pcl::PointXYZRGB>);


        //viewer.showCloud(base_pc_ptr); //何故かThinkPad T450では動かない


        //ダウンサンプリング
        pcl::VoxelGrid<pcl::PointXYZRGB> vg;
        vg.setInputCloud(base_pc_ptr);
        vg.setLeafSize(0.01, 0.01, 0.01); //ダウンサンプリングの間隔[m]
        vg.filter(*pt_pc_ptr);


        //パススルーフィルタでポイントクラウドの領域を制限
        pcl::PassThrough<pcl::PointXYZRGB> pt;

        pt.setInputCloud(pt_pc_ptr);
        pt.setFilterFieldName("x");
        pt.setFilterLimits(p_aoi_x_min_, p_aoi_x_max_);
        pt.setFilterLimitsNegative(false);
        pt.filter(*pt_pc_ptr);

        pt.setInputCloud(pt_pc_ptr);
        pt.setFilterFieldName("y");
        pt.setFilterLimits(p_aoi_y_min_, p_aoi_y_max_);
        pt.setFilterLimitsNegative(false);
        pt.filter(*pt_pc_ptr);

        pt.setInputCloud(pt_pc_ptr);        
        pt.setFilterFieldName("z");
        pt.setFilterLimits(p_aoi_z_min_, p_aoi_z_max_);
        pt.setFilterLimitsNegative(false);
        pt.filter(*pt_pc_ptr);


        //パススルーフィルタの結果をPublish
        pcl::toROSMsg(*pt_pc_ptr, o_smpc2_);
        o_smpc2_.header.frame_id = "/base_footprint";
        pub_smpc2_pt_.publish(o_smpc2_);


        //ポイントクラウドをコピー
        pcl::copyPointCloud<pcl::PointXYZRGB, pcl::PointXYZRGB>(*pt_pc_ptr, *proc_pc_ptr);


        double obj_limit_x_min;
        double obj_limit_x_max;
        double obj_limit_y_min;
        double obj_limit_y_max;
        double obj_limit_z_min;


        if(p_mode_1_ == "low"){
            //平面検出
            pcl::ModelCoefficients::Ptr model_coef(new pcl::ModelCoefficients);
            pcl::PointIndices::Ptr indices(new pcl::PointIndices);


            //セグメンテーションオブジェクト生成
            pcl::SACSegmentation<pcl::PointXYZRGB> sac_seg;
            //セグメンテーションオブジェクト必須オプション指定
            sac_seg.setModelType(pcl::SACMODEL_PLANE);
            sac_seg.setMethodType(pcl::SAC_RANSAC);
            sac_seg.setDistanceThreshold(0.01); //[m]
            //セグメンテーションオブジェクトオプション指定
            sac_seg.setOptimizeCoefficients(true);


            while(1){
                //セグメンテーションオブジェクトにポイントクラウドを入力して平面検出
                sac_seg.setInputCloud(proc_pc_ptr);
                sac_seg.segment (*indices, *model_coef);

                //平面が検出されない場合
                if(indices->indices.size() < 100){
                    ROS_INFO("[obj_proc]: There is no plane.");
                    return;
                }

                //xy平面の法線ベクトル(0, 0, 1)
                //  z = 0 より
                //  ax + by +cz +d = 0
                //  0x + 0y + 1z = 0
                //任意平面の法線ベクトル(A, B, C)
                //  Ax + By + Cz + D = 0
                //  A: model_coef->values[0]
                //  B: model_coef->values[1]
                //  C: model_coef->values[2]
                //  D: model_coef->values[3]
                //2平面のなす角度
                //  cosΘ = abs(aA + bB + cC) / (sqrt(a^2 + b^2 + c^2) * sqrt(A^2 + B^2 + C^2))
                double angle_of_2plane;
                angle_of_2plane = abs(model_coef->values[2]);
                angle_of_2plane /= sqrt(pow(model_coef->values[0], 2) + pow(model_coef->values[1], 2) + pow(model_coef->values[2], 2));
                angle_of_2plane = acos(angle_of_2plane);

                if(angle_of_2plane > -0.09 && angle_of_2plane < 0.09){
                    //平面を赤色にする
                    obj_limit_x_min = proc_pc_ptr->points[indices->indices[0]].x;
                    obj_limit_x_max = proc_pc_ptr->points[indices->indices[0]].x;
                    obj_limit_y_min = proc_pc_ptr->points[indices->indices[0]].y;
                    obj_limit_y_max = proc_pc_ptr->points[indices->indices[0]].y;
                    obj_limit_z_min = proc_pc_ptr->points[indices->indices[0]].z;

                    for(size_t i = 1; i < indices->indices.size(); ++i){
                        proc_pc_ptr->points[indices->indices[i]].r = 255;
                        proc_pc_ptr->points[indices->indices[i]].g = 0;
                        proc_pc_ptr->points[indices->indices[i]].b = 0;

                        if(obj_limit_x_min > proc_pc_ptr->points[indices->indices[i]].x){
                            obj_limit_x_min = proc_pc_ptr->points[indices->indices[i]].x;
                        }
                        if(obj_limit_x_max < proc_pc_ptr->points[indices->indices[i]].x){
                            obj_limit_x_max = proc_pc_ptr->points[indices->indices[i]].x;
                        }
                        if(obj_limit_y_min > proc_pc_ptr->points[indices->indices[i]].y){
                            obj_limit_y_min = proc_pc_ptr->points[indices->indices[i]].y;
                        }
                        if(obj_limit_y_max < proc_pc_ptr->points[indices->indices[i]].y){
                            obj_limit_y_max = proc_pc_ptr->points[indices->indices[i]].y;
                        }
                        if(obj_limit_z_min > proc_pc_ptr->points[indices->indices[i]].z){
                            obj_limit_z_min = proc_pc_ptr->points[indices->indices[i]].z;
                        }
                    }

                    if(obj_limit_z_min > p_plane_height_ - 0.05 && obj_limit_z_min < p_plane_height_ + 0.05){
                        break;
                    }
                }

                //平面除去
                pcl::ExtractIndices<pcl::PointXYZRGB> ext;
                ext.setInputCloud(proc_pc_ptr);
                ext.setIndices(indices);
                ext.setNegative(true); //trueにすると平面を除去、falseにすると平面以外を除去
                ext.filter(*proc_pc_ptr);
            }


            //平面を赤色にしたポイントクラウドをPublish
            pcl::toROSMsg(*proc_pc_ptr, o_smpc2_);
            o_smpc2_.header.frame_id = "/base_footprint";
            pub_smpc2_proc_.publish(o_smpc2_);

            
            //平面除去
            pcl::ExtractIndices<pcl::PointXYZRGB> ext;
            ext.setInputCloud(proc_pc_ptr);
            ext.setIndices(indices);
            ext.setNegative(true); //trueにすると平面を除去、falseにすると平面以外を除去
            ext.filter(*obj_pc_ptr);
        }
        else if(p_mode_1_ == "high"){
            double proc_pc_y_min[2] = {p_aoi_y_max_, p_aoi_y_max_};
            double plane_height = 0;


            for(size_t i = 0; i < proc_pc_ptr->points.size(); ++i){
                if(proc_pc_ptr->points[i].x > -0.1 && proc_pc_ptr->points[i].x < 0.0){
                    if(proc_pc_ptr->points[i].y < proc_pc_y_min[0]){
                        proc_pc_y_min[0] = proc_pc_ptr->points[i].y;
                    }
                }
                if(proc_pc_ptr->points[i].x > 0.0 && proc_pc_ptr->points[i].x < 0.1){
                    if(proc_pc_ptr->points[i].y < proc_pc_y_min[1]){
                        proc_pc_y_min[1] = proc_pc_ptr->points[i].y;
                    }
                }
            }


            for(size_t i = 0; i < proc_pc_ptr->points.size(); ++i){
                if(proc_pc_ptr->points[i].x > -0.1 && proc_pc_ptr->points[i].x < 0.0){
                    if(proc_pc_ptr->points[i].y < proc_pc_y_min[0] + 0.025){
                        if(proc_pc_ptr->points[i].z > plane_height){
                            plane_height = proc_pc_ptr->points[i].z;
                        }
                    }
                }
                if(proc_pc_ptr->points[i].x > 0.0 && proc_pc_ptr->points[i].x < 0.1){
                    if(proc_pc_ptr->points[i].y < proc_pc_y_min[1] + 0.025){
                        if(proc_pc_ptr->points[i].z > plane_height){
                            plane_height = proc_pc_ptr->points[i].z;
                        }
                    }
                }
            }


            pt.setInputCloud(proc_pc_ptr);
            pt.setFilterFieldName("y");
            //161211
            //pt.setFilterLimits(proc_pc_y_min[1] + 0.025, p_aoi_y_max_);
            pt.setFilterLimits(0.8 + 0.02, p_aoi_y_max_); //0.025
            pt.setFilterLimitsNegative(false);
            pt.filter(*proc_pc_ptr);

            pt.setInputCloud(proc_pc_ptr);
            pt.setFilterFieldName("z");
            //161211
            //pt.setFilterLimits(plane_height + 0.01, p_aoi_z_max_);
            pt.setFilterLimits(1.1 + 0.01, p_aoi_z_max_);
            pt.setFilterLimitsNegative(false);
            pt.filter(*obj_pc_ptr);


            obj_limit_x_min = p_aoi_x_min_;
            obj_limit_x_max = p_aoi_x_max_;
            obj_limit_y_min = p_aoi_y_min_;
            obj_limit_y_max = p_aoi_y_max_;
            obj_limit_z_min = p_plane_height_;


            pcl::toROSMsg(*obj_pc_ptr, o_smpc2_);
            o_smpc2_.header.frame_id = "/base_footprint";
            pub_smpc2_proc_.publish(o_smpc2_);
        }


        ROS_INFO("obj_limit_x_min: %f", obj_limit_x_min);
        ROS_INFO("obj_limit_x_max: %f", obj_limit_x_max);
        ROS_INFO("obj_limit_y_min: %f", obj_limit_y_min);
        ROS_INFO("obj_limit_y_max: %f", obj_limit_y_max);
        ROS_INFO("obj_limit_z_min: %f", obj_limit_z_min);


        //クラスタリング
        pcl::search::KdTree<pcl::PointXYZRGB>::Ptr kdtree(new pcl::search::KdTree<pcl::PointXYZRGB>);
        kdtree->setInputCloud(obj_pc_ptr);

        std::vector<pcl::PointIndices> cluster_indices; //クラスター情報

        pcl::EuclideanClusterExtraction<pcl::PointXYZRGB> ec_ext;
        ec_ext.setClusterTolerance(0.05); //クラスターを分ける閾値[m]
        ec_ext.setMinClusterSize(50); //最小のクラスターの値を設定
        ec_ext.setMaxClusterSize(1000); //最大のクラスターの値を設定
        ec_ext.setSearchMethod(kdtree); //検索に使用する手法を指定
        ec_ext.setInputCloud(obj_pc_ptr); //点群を入力
        ec_ext.extract(cluster_indices); //クラスター情報を出力


        ROS_INFO("[obj_proc]: Clustering SUCCESS");


        //クラスタを1塊ごとに出力
        for(std::vector<pcl::PointIndices>::const_iterator cit1 = cluster_indices.begin(); cit1 != cluster_indices.end(); ++cit1){
            //オブジェクトの各座標における最小、最大値
            double obj_x_min = obj_pc_ptr->points[*cit1->indices.begin()].x;
            double obj_x_max = obj_pc_ptr->points[*cit1->indices.begin()].x;
            double obj_y_min = obj_pc_ptr->points[*cit1->indices.begin()].y;
            double obj_y_max = obj_pc_ptr->points[*cit1->indices.begin()].y;
            double obj_z_min = obj_pc_ptr->points[*cit1->indices.begin()].z;
            double obj_z_max = obj_pc_ptr->points[*cit1->indices.begin()].z;
        
            for(std::vector<int>::const_iterator cit2 = cit1->indices.begin(); cit2 != cit1->indices.end(); cit2++){
                if(obj_x_min > obj_pc_ptr->points[*cit2].x){
                     obj_x_min = obj_pc_ptr->points[*cit2].x;
                }
                if(obj_x_max < obj_pc_ptr->points[*cit2].x){
                    obj_x_max = obj_pc_ptr->points[*cit2].x;
                }
                if(obj_y_min > obj_pc_ptr->points[*cit2].y){
                    obj_y_min = obj_pc_ptr->points[*cit2].y;
                }
                if(obj_y_max < obj_pc_ptr->points[*cit2].y){
                    obj_y_max = obj_pc_ptr->points[*cit2].y;
                }
                if(obj_z_min > obj_pc_ptr->points[*cit2].z){
                    obj_z_min = obj_pc_ptr->points[*cit2].z;
                }
                if(obj_z_max < obj_pc_ptr->points[*cit2].z){
                    obj_z_max = obj_pc_ptr->points[*cit2].z;
                }            
            }

            ROS_INFO("obj_x_min: %f", obj_x_min);
            ROS_INFO("obj_x_max: %f", obj_x_max);
            ROS_INFO("obj_y_min: %f", obj_y_min);
            ROS_INFO("obj_y_max: %f", obj_y_max);
            ROS_INFO("obj_z_min: %f", obj_z_min);

            //オブジェクト座標のバリデート
            if(obj_x_min < obj_limit_x_min + 0.02){ //0.02
                ROS_INFO("[obj_proc]: Limit x min FAIL");
                continue;
            }
            if(obj_x_max > obj_limit_x_max - 0.02){ //0.02
                ROS_INFO("[obj_proc]: Limit x max FAIL");
                continue;
            }
            if(obj_y_min < obj_limit_y_min + 0.02){ //0.02
                ROS_INFO("[obj_proc]: Limit y min FAIL");
                continue;
            }
            if(obj_y_max > obj_limit_y_max - 0.02){ //0.02
                ROS_INFO("[obj_proc]: Limit y max FAIL");
                continue;
            }
            if(obj_z_min > obj_limit_z_min + 0.05){
                ROS_INFO("[obj_proc]: Limit z min FAIL");
                continue;
            }


            ROS_INFO("[obj_proc]: Detect object SUCCESS");


            //ポイントクラウドをコピー
            pcl::copyPointCloud<pcl::PointXYZRGB, pcl::PointXYZRGB>(*cam_pc_ptr, *cam_tmp_pc_ptr); 


            //オブジェクトとそれ以外の領域でポイントクラウドの色を変える
            for(size_t i = 0; i < base_pc_ptr->points.size(); ++i){
                if(obj_x_min < base_pc_ptr->points[i].x &&
                   obj_x_max > base_pc_ptr->points[i].x &&
                   obj_y_min < base_pc_ptr->points[i].y &&
                   obj_y_max > base_pc_ptr->points[i].y &&
                   obj_z_min < base_pc_ptr->points[i].z &&
                   obj_z_max > base_pc_ptr->points[i].z){
                    //オブジェクト(カラーのまま)
                    //cam_tmp_pc_ptr->points[i].r = 255;
                    //cam_tmp_pc_ptr->points[i].g = 255;
                    //cam_tmp_pc_ptr->points[i].b = 255;
                }
                else{
                    //オブジェクト以外(黒)
                    cam_tmp_pc_ptr->points[i].r = 0;
                    cam_tmp_pc_ptr->points[i].g = 0;
                    cam_tmp_pc_ptr->points[i].b = 0;
                }               
            }


            //オブジェクト以外を黒にしたイメージを生成
            pcl::toROSMsg(*cam_tmp_pc_ptr, o_smpc2_);
            o_smpc2_.header.frame_id = "/head_rgbd_sensor_rgb_frame";
            sensor_msgs::Image smi_obj;
            pcl::toROSMsg(o_smpc2_, smi_obj);
                    

            cv_img_ptr_ = cv_bridge::toCvCopy(smi_obj, sensor_msgs::image_encodings::BGR8);

            cv::Mat mat_obj;
            mat_obj = cv_img_ptr_->image;


            cv::Mat mat_aoi;
            int pos_aoi[4];
            if(get_aoi(mat_cam_, mat_obj, &mat_aoi, pos_aoi)){
                ROS_INFO("[obj_proc]: Get aoi FAIL");
                continue;
            }


            if(p_mode_2_ == "surf"){
                //TODO: surf特徴量で学習済オブジェクトか判定
            }


            //認識用オブジェクトイメージをPublish
            cv_img_ptr_->image = mat_aoi;
            img_t_pub_smi_obj_.publish(cv_img_ptr_->toImageMsg());


            if(p_mode_0_ == "pre"){
                cv::imshow("for_detect_key", mat_aoi);

                if(cv::waitKey(1) != -1){
                    if(flag_o_dataset_ == 0){
                        flag_o_dataset_ = 1;
                    }
                    else{
                        flag_o_dataset_ = 0;
                    }
                }

                if(flag_o_dataset_ == 1){
                    ostringstream oss;
                    oss << path_dataset_dir_ << "/" << cnt_dataset_ << ".jpg";
                    string path_dataset_file = oss.str();
                    imwrite(path_dataset_file, mat_aoi);
                    cnt_dataset_++;

                    ROS_INFO("[obj_proc]: %s", path_dataset_file.c_str());
                }

                return;
            }


            cv_bridge::CvImage cv_img;
            cv_img.image = mat_aoi;
            sensor_msgs::Image smi_aoi;
            cv_img.toImageMsg(smi_aoi);


            //オブジェクト認識ROSノード（obj_rec.py）にActionを介して認識用オブジェクトイメージを送信
            hsr_common_pkg::ObjRecGoal goal;
            goal.obj_rec_goal = smi_aoi;
            obj_rec_action_.sendGoal(goal);

            //オブジェクト認識ROSノード（obj_rec.py）の結果を待つ
            obj_rec_action_.waitForResult();

            //オブジェクト認識ROSノード（obj_rec.py）の結果を取得
            int obj_rec_result = obj_rec_action_.getResult()->obj_rec_result;


            if(p_mode_3_ == "id"){
                if(obj_rec_result != p_target_id_){
                    continue;
                }
            }


            /*
            //結果を投票
            bool flag_poll = 0; //投票が行われたかチェックするフラグ
            for(size_t i = 0; i < obj_pos_.size(); i++){
                if(obj_pos_[i][0] == obj_rec_result){
                    //ほぼ同じ座標か確認
                    if(abs(obj_pos_[i][1] - ((obj_x_min + obj_x_max) / 2)) < 0.075 &&
                       abs(obj_pos_[i][2] - ((obj_y_min + obj_y_max) / 2)) < 0.075 &&
                       abs(obj_pos_[i][3] - ((obj_z_min + obj_z_max) / 2)) < 0.2){
                        //2回以上投票された場合
                        if(obj_pos_[i][8] >= 2){
                            if(p_mode_3_ == "id"){
                                nh_.setParam("/param/ctrl/arm/grasp/target/pos/x", (obj_x_min + obj_x_max) / 2);
                                nh_.setParam("/param/ctrl/arm/grasp/target/pos/y", (obj_y_min + obj_y_max) / 2);
                                nh_.setParam("/param/ctrl/arm/grasp/target/pos/z", (obj_z_min + obj_z_max) / 2);
                                      
                                exit(0);
                            }
                        }

                        flag_poll = 1;                    
                        obj_pos_[i][8]++;
                    }
                }
            }
            */


            //結果を投票
            bool flag_poll = 0; //投票が行われたかチェックするフラグ
            for(size_t i = 0; i < obj_pos_.size(); i++){
                //ほぼ同じ座標か確認
                if(abs(obj_pos_[i][1] - ((obj_x_min + obj_x_max) / 2)) < 0.075 &&
                   abs(obj_pos_[i][2] - ((obj_y_min + obj_y_max) / 2)) < 0.075 &&
                   abs(obj_pos_[i][3] - ((obj_z_min + obj_z_max) / 2)) < 0.2){
                    //2回以上投票された場合
                    if(obj_pos_[i][8] >= 2){
                        flag_poll = 1;
                    }
                    else{
                        if(obj_pos_[i][0] == obj_rec_result){
                            flag_poll = 1;
                            obj_pos_[i][1] = (obj_pos_[i][1] + (obj_x_min + obj_x_max) / 2) / 2;
                            obj_pos_[i][2] = (obj_pos_[i][2] + (obj_y_min + obj_y_max) / 2) / 2;
                            obj_pos_[i][3] = (obj_pos_[i][3] + (obj_z_min + obj_z_max) / 2) / 2;
                            obj_pos_[i][8]++;
                        }
                    }
                }
            }


            //新規投票
            if(flag_poll == 0){
                vector<float> obj_pos_buf(9);
                obj_pos_buf[0] = obj_rec_result;
                obj_pos_buf[1] = (obj_x_min + obj_x_max) / 2;
                obj_pos_buf[2] = (obj_y_min + obj_y_max) / 2;
                obj_pos_buf[3] = (obj_z_min + obj_z_max) / 2;
                obj_pos_buf[4] = pos_aoi[0];
                obj_pos_buf[5] = pos_aoi[1];
                obj_pos_buf[6] = pos_aoi[2];
                obj_pos_buf[7] = pos_aoi[3];
                obj_pos_buf[8] = 1;
                obj_pos_.push_back(obj_pos_buf);
            }
        }
    }


    //--------------------------------------------------
    //aoi対象がRGB，それ以外が黒の画像からaoi画像を切り出す関数
    //引数1: 元画像
    //引数2: aoi対象がRGB，それ以外が黒の画像
    //引数3: aoi画像
    //--------------------------------------------------
    int get_aoi(cv::Mat rgb_mat, cv::Mat mat_i, cv::Mat* mat_aoi, int *pos_aoi){
        //aoi対象ピクセルの座標をvector<cv::Point2i>に詰める
        //aoi対象ピクセルの中心を求める
        vector<cv::Point2i> point_obj;
        cv::Point2i center_obj(0, 0);

        for(int y = 0; y < mat_i.rows; y = y + 5){
            for(int x = 0; x < mat_i.cols; x = x + 5){
                //黒以外か
                if(mat_i.at<cv::Vec3b>(y, x)[0] != 0 && //[0]:B [1]:G [2]:R
                   mat_i.at<cv::Vec3b>(y, x)[1] != 0 &&
                   mat_i.at<cv::Vec3b>(y, x)[2] != 0){
                    point_obj.push_back(cv::Point2i(x, y));
                    center_obj.x += x;
                    center_obj.y += y;
                }
            }
        }

        //0除算防止
        if(point_obj.size() != 0){
            center_obj.x = center_obj.x / (int)point_obj.size();
            center_obj.y = center_obj.y / (int)point_obj.size();
        }
          
        //aoi対象を囲む回転有矩形を算出
        cv::Mat mat_point(point_obj);
        cv::RotatedRect rotated_rect = cv::minAreaRect(cv::Mat(mat_point).reshape(2));

        //イメージ左側の回転角度を算出
        if(rotated_rect.angle >= -45){
            //rotated_rect.angle = rotated_rect.angle;
        }
        //イメージ右側の回転角度を算出
        else{
            rotated_rect.angle = rotated_rect.angle + 90;
        }

        //aoi対象を中心としたイメージ回転行列を算出
        cv::Mat rotation_matrix = cv::getRotationMatrix2D(center_obj, rotated_rect.angle, 1);

        //入力イメージ、カラーイメージを回転
        cv::Mat mat_i_rot;
        cv::warpAffine(mat_i, mat_i_rot, rotation_matrix, mat_i.size());
        cv::Mat mat_rot;
        cv::warpAffine(rgb_mat, mat_rot, rotation_matrix, rgb_mat.size());

        //aoi対象の各座標における最小、最大値を求める
        int aoi_x_min = mat_i_rot.cols;
        int aoi_x_max = 0;
        int aoi_y_min = mat_i_rot.rows;
        int aoi_y_max = 0;
        
        for(int y = 0; y < mat_i_rot.rows; y++){
            for(int x = 0; x < mat_i_rot.cols; x++){
                if(mat_i_rot.at<cv::Vec3b>(y, x)[0] != 0 &&
                   mat_i_rot.at<cv::Vec3b>(y, x)[1] != 0 &&
                   mat_i_rot.at<cv::Vec3b>(y, x)[2] != 0){
                    if(aoi_x_min > x){
                        aoi_x_min = x;
                    }
                    if(aoi_x_max < x){
                        aoi_x_max = x;
                    }
                    if(aoi_y_min > y){
                        aoi_y_min = y;
                    }
                    if(aoi_y_max < y){
                        aoi_y_max = y;
                    }
                }
            }
        }

        //aoiイメージを生成
        if(aoi_x_min != mat_i.cols && aoi_x_max != 0 && aoi_y_min != mat_i.rows && aoi_y_max != 0){
            //*mat_aoi = mat_i_rot(cv::Rect(aoi_x_min, aoi_y_min, aoi_x_max - aoi_x_min, aoi_y_max - aoi_y_min));
            *mat_aoi = mat_rot(cv::Rect(aoi_x_min, aoi_y_min, aoi_x_max - aoi_x_min, aoi_y_max - aoi_y_min));
            *pos_aoi++ = aoi_x_min;
            *pos_aoi++ = aoi_x_max;
            *pos_aoi++ = aoi_y_min;
            *pos_aoi++ = aoi_y_max;
            return 0;        
        }
        else{
            return 1;
        }
   }
};


//--------------------------------------------------
//メイン関数
//--------------------------------------------------
int main (int argc, char** argv){
    ros::init (argc, argv, "obj_proc");

    ObjRec ObjRec;

    while(ros::ok()){
        ros::spinOnce(); 
    }
}
