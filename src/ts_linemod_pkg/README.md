# linergbd_node
### これは？
LineRGBDによるテンプレートマッチングだぶり

### 使い方
学習用のPCDファイルを用意するぶり  
PCDファイルの生成方法は下記のcreate\_template\_pcdを参照するぶり

プログラム起動時に学習用PCDファイルが読み込まれるぶり  
ファイルパスについてはプログラムを適宜変更するぶり  
以下の例の場合，/home/yuichirotanaka15/usr/pcd\_db170608/1\_green\_tea/下にあるpcdファイル...を読み込んでいくぶり

```cpp
// 学習用PCDファイルのパラメータ
char OBJECT_NAME[10][20] = {
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
const char* PCDFILEPATH = "/home/yuichirotanaka15/usr/pcd_db170608";
```

学習ありで実行するには以下のようにtrainという引数をわたすぶり  
実行時にはopenni2.launchを起動しておくぶり

```sh
$ rosrun ts_linemod_pkg linergbd_node train
```

学習には時間がかかる(１つのテンプレートにつき1秒程度)ぶり

でも安心するぶり！  
一度学習すると学習済みファイルが生成されるぶり  
次回から学習済みファイルを読み込めば学習の必要はないぶり

学習なしで実行するには以下のようにnotrainという引数をわたすぶり

```sh
$ rosrun ts_linemod_pkg linergbd_node notrain
```

### コードの詳しい仕様
LineRGBDクラスには学習済みファイルを保存する機能がなかったぶり  
そこでLineRGBDEXという保存機能付きのクラスを自作したぶり  
クラスはsrc/linergbdex.hppに定義されているぶり

PCLMatchingというクラスが処理の本体ぶり  
trainTemplate()とdetectTemplate()というprivateのメソッドがあるぶり  
これらがLineRGBDのテンプレート追加関数とテンプレート検出関数になっているぶり  
これらのメソッドをPCLMatchingのコンストラクタおよびサブ関数で呼んでいるぶり

trainTemplate()には2種のポイントクラウドとオブジェクトIDをわたすぶり  
entireが全体のポイントクラウドでobjectが物体領域のポイントクラウドだぶり  
オブジェクトIDは物体のIDで任意に指定するぶり

```cpp
void trainTemplate(
    pcl::PointCloud<pcl::PointXYZRGBA>::Ptr &entire,
    pcl::PointCloud<pcl::PointXYZRGBA>::Ptr &object,
    int object_id
){
    ...
}
```

detectTemplate()には1種のポイントクラウドをわたすぶり  
これはtrainTemplate()のときにわたしたentireと同じ形式のものをわたすぶり  
検出結果が返り値になるぶり  
形式については以下のリンクを参照するぶり  
物体のIDや位置，サイズなどがわかるぶり

http://docs.pointclouds.org/trunk/structpcl_1_1_line_r_g_b_d_1_1_detection.html

```cpp
std::vector<pcl::LineRGBD<pcl::PointXYZRGBA>::Detection> detectTemplate(
    pcl::PointCloud<pcl::PointXYZRGBA>::Ptr &cloud
){
    ...
}
```

検出に関してはパラメータがあるぶり  
大きさやテンプレートの一致度などの指定があるぶり

```cpp
// 検出のパラメータ
double MAGNITUDE_THRESHOLD = 10.0;
double DETECTION_THRESHOLD = 0.75;
```

注意しなければならないのはtrainTemplate()とdetectTemplate()に渡すポイントクラウドは  
*organized*でなければならないということぶり  
だからこのコードではtfは使っていないし，パススルーフィルターも適用していないぶり  
実装では/camera\_depth\_optical\_frame座標系のポイントクラウドを入力しているぶりよ

このコードでは"/camera/depth\_registered/points"をサブスクライブしたときに検出処理を始めるようになっているぶり  
以下の実装にあるようにsubFuncDetection()がサブ関数として呼ばれるぶり

```cpp
this->sub_pcl_ = this->nh_.subscribe("/camera/depth_registered/points", 1, &PCLMatching::subFuncDetection, this);
```

subFuncDetection()の中ではパススルーフィルターの代わりに  
ある領域を除いてポイントクラウドを黒く塗りつぶす処理を加えているぶり  
この領域指定はパラメタライズ化されているぶり  
パラメータは適宜プログラムを書き換えるぶり

```cpp
// パススルーフィルターのパラメータ（camera_depth_optical_frame系）
double PTX_MIN = -0.5; //[m]
double PTX_MAX =  0.5; //[m]
double PTY_MIN = -0.5; //[m]
double PTY_MAX =  1.5; //[m]
double PTZ_MIN =  0.5; //[m]
double PTZ_MAX =  1.5; //[m]
```
---

# create_template_pcd
### これは？
データセット作成用のコードぶり

### 使い方
PCLMatchingクラスのtrainTemplate()に渡すためのPCDファイルを生成するぶり  
openni2.launchを起動してからプログラムを起動するぶり

```sh
$ rosrun ts_linemod_pkg create_template_pcd
```

プログラムの中ではポイントクラウドの平面検出と平面除去の処理が行われているぶり  
処理前のポイントクラウドと処理後のポイントクラウドを保存する機能がついているぶり  

プログラムを起動すると赤い窓がでてくるぶり  
この窓が選択された状態でキーボードの1を押すと現在取得しているポイントクラウドのPCDファイルが保存されるぶり  

取得しているポイントクラウドはrvizで確認できるぶり  
/obj/pt0と/obj/pt1にそれぞれパブリッシュされているぶり

保存先は以下のようにプログラムを適宜書き換えて指定するぶり

```cpp
// PCD出力先
const char* OUTPUTPATH = "/home/yuichirotanaka15/usr";
```

出力されるファイルはent\_hogehoge.pcdとobj\_hogehoge.pcdだぶり  
それぞれ先の処理前のポイントクラウドと処理後のポイントクラウドだぶり  
これらのポイントクラウドをlinergbd\_node.trainTemplate()に読み込ませるぶり

ファイル構成は以下のようなものが想定されているぶり

* 1_green_tea
    * ent_0.pcd
    * obj_0.pcd
    * ent_1.pcd
    * obj_1.pcd
    * ...
* 2_cafe_au_lait
    * ent_0.pcd
    * obj_0.pcd
    * ent_1.pcd
    * obj_1.pcd
    * ...
* ...
