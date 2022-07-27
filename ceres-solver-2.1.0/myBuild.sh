DIRECTORY='install'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  rm -r -f install
fi

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
  -Dgflags_DIR=$SOURCE_ROOT_DIR/gflags-master/install/lib/cmake/gflags \
  -Dglog_DIR=$SOURCE_ROOT_DIR/glog-master/install/lib/cmake/glog \
  -DEigen3_DIR=$SOURCE_ROOT_DIR/eigen-3.4.0/install/share/eigen3/cmake \
  -DSuiteSparse_INCLUDES_DIR=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/include \
  -DSuiteSparse_LIBS_DIR=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/lib \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
  -DBUILD_SHARED_LIBS=ON \
  ..

make -j6

make install