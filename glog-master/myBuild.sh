DIRECTORY='install'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  rm -r install
fi

DIRECTORY='build'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  rm -r build
  mkdir build
  cd build
else
  mkdir build
  cd build
fi

# SOURCE_ROOT_DIR=/home/zhegushao/Documents/orb-standalone
#??? gflags can be found even if we don't provide the path !!!
cmake -Dgflags_DIR=${SOURCE_ROOT_DIR}/gflags-master/install/lib/cmake/gflags \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
  -DBUILD_SHARED_LIBS=ON \
  ..

make -j6

make install