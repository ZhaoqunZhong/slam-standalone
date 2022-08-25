# export CC=/usr/bin/clang-15
# export CXX=/usr/bin/clang++-15
# export CPP=/usr/bin/clang-cpp-15
# export LD=/usr/bin/ld64.lld-15

# DIRECTORY='install'
# if [ -d "$DIRECTORY" ]; then
#   # echo "build folder exists"
#   rm -r -f install
# fi

DIRECTORY='build'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  cd build
  rm -r *
else
  mkdir build
  cd build
fi

SOURCE_ROOT_DIR=/home/zhegushao/Documents/orb-standalone

cmake -DCMAKE_CXX_STANDARD=17 \
  -DEigen3_DIR=$SOURCE_ROOT_DIR/eigen-3.4.0/install/share/eigen3/cmake\
  -DBoost_DIR=$SOURCE_ROOT_DIR/boost_1_79_0/install/lib/cmake/Boost-1.79.0 \
  -DOpenCV_DIR=$SOURCE_ROOT_DIR/opencv-4.5.5/install/lib/cmake/opencv4 \
  -DPCL_DIR=$SOURCE_ROOT_DIR/pcl-master/install/share/pcl-1.12 \
  -DSophus_DIR=$SOURCE_ROOT_DIR/Sophus-master/install/share/sophus/cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DBUILD_SHARED_LIBS=ON \
  ..

make -j4

# make install