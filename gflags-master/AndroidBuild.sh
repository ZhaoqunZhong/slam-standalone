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

cmake -DCMAKE_CXX_STANDARD=17 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../android-install \
  -DBUILD_SHARED_LIBS=ON \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=28 \
  -DCMAKE_TOOLCHAIN_FILE=/home/zhegushao/Android/Sdk/ndk/23.1.7779620/build/cmake/android.toolchain.cmake \
  -DANDROID_STL=c++_shared \
  ..

make -j4

make install