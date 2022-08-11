
DIRECTORY='build'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  cd build
  rm -r *
else
  mkdir build
  cd build
fi

# SOURCE_ROOT_DIR=/home/zhegushao/Documents/orb-standalone

cmake -DCMAKE_CXX_STANDARD=17 \
  -Dglog_DIR=$SOURCE_ROOT_DIR/glog-master/install/lib/cmake/glog \
  -DEigen3_DIR=$SOURCE_ROOT_DIR/eigen-3.4.0/install/share/eigen3/cmake \
  -DCeres_DIR=$SOURCE_ROOT_DIR/ceres-solver-2.1.0/install/lib/cmake/Ceres \
  -DSuiteSparse_INCLUDES_DIR=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/include \
  -DSuiteSparse_LIBS_DIR=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/lib \
  -Dgflags_DIR=$SOURCE_ROOT_DIR/gflags-master/install/lib/cmake/gflags \
  -DOpenCV_DIR=$SOURCE_ROOT_DIR/opencv-4.5.5/install/lib/cmake/opencv4 \
  -DBoost_DIR=$SOURCE_ROOT_DIR/boost_1_79_0/install/lib/cmake/Boost-1.79.0 \
  -DPangolin_DIR=$SOURCE_ROOT_DIR/Pangolin-0.6/install/lib/cmake/Pangolin \
  -DCMAKE_BUILD_TYPE=Release \
  ..


make -j4

