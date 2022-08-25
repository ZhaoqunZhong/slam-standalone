DIRECTORY='android-install'
if [ -d "$DIRECTORY" ]; then
  rm -r android-install
fi

DIRECTORY='android-build'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  cd android-build
  rm -r *
else
  mkdir android-build
  cd android-build
fi

SOURCE_ROOT_DIR=/home/zhegushao/Documents/orb-standalone

cmake -DCMAKE_CXX_STANDARD=17 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../android-install \
  -DBUILD_SHARED_LIBS=ON \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=28 \
  -DCMAKE_TOOLCHAIN_FILE=/home/zhegushao/Android/Sdk/ndk/23.1.7779620/build/cmake/android.toolchain.cmake \
  -Dgflags_DIR=$SOURCE_ROOT_DIR/gflags-master/android-install/lib/cmake/gflags \
  -Dglog_DIR=$SOURCE_ROOT_DIR/glog-master/android-install/lib/cmake/glog \
  -DEigen3_DIR=$SOURCE_ROOT_DIR/eigen-3.4.0/install/share/eigen3/cmake \
  -DSuiteSparse_INCLUDES_DIR=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/android-install/include \
  -DSuiteSparse_LIBS_DIR=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/android-install/lib \
  -DQML_LIBRARY=${SOURCE_ROOT_DIR}/QML/1.4.0/arm64/lp64/lib/libQML-1.4.0.so \
  ..

# make -j4

# make install