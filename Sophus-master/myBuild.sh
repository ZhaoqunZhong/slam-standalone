
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

SOURCE_ROOT_DIR=/home/zhegushao/Documents/orb-standalone

cmake -DCMAKE_CXX_STANDARD=17 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
  -DBUILD_SHARED_LIBS=ON \
  -DEigen3_DIR=$SOURCE_ROOT_DIR/eigen-3.4.0/install/share/eigen3/cmake \
  -DBUILD_SOPHUS_TESTS=OFF \
  ..

make -j4

make install
