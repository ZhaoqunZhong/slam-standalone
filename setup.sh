sudo apt-get install liblapack-dev libblas-dev libgtk2.0-dev libcanberra-gtk-module libcanberra-gtk3-module libtbb-dev libflann-dev libvtk7-dev
# gtk related ones are for opencv.

SOURCE_ROOT_DIR=$(pwd)
# echo "SOURCE_ROOT_DIR: $SOURCE_ROOT_DIR"

cd boost_1_79_0
./bootstrap.sh --prefix=install
./b2 install

cd ../suitesparse-metis-for-windows
sh myBuild.sh

sed -i "1i SOURCE_ROOT_DIR=$SOURCE_ROOT_DIR" $SOURCE_ROOT_DIR/eigen-3.4.0/myBuild.sh
cd ../eigen-3.4.0
sh myBuild.sh

cd ../gflags-master
sh myBuild.sh 

sed -i "1i SOURCE_ROOT_DIR=$SOURCE_ROOT_DIR" $SOURCE_ROOT_DIR/glog-master/myBuild.sh
cd ../glog-master
sh myBuild.sh

sed -i "1i SOURCE_ROOT_DIR=$SOURCE_ROOT_DIR" $SOURCE_ROOT_DIR/ceres-solver-2.1.0/myBuild.sh
cd ../ceres-solver-2.1.0
sh myBuild.sh

sed -i "1i SOURCE_ROOT_DIR=$SOURCE_ROOT_DIR" $SOURCE_ROOT_DIR/opencv-4.5.5/myBuild.sh
cd ../opencv-4.5.5
sh myBuild.sh

sed -i "1i SOURCE_ROOT_DIR=$SOURCE_ROOT_DIR" $SOURCE_ROOT_DIR/Pangolin-0.6/myBuild.sh
cd ../Pangolin-0.6
sh myBuild.sh

sed -i "1i SOURCE_ROOT_DIR=$SOURCE_ROOT_DIR" $SOURCE_ROOT_DIR/test-dependencies/myBuild.sh
cd ../test-dependencies
sh myBuild.sh




