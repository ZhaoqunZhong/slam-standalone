export CC=/usr/bin/clang-15
export CXX=/usr/bin/clang++-15
export CPP=/usr/bin/clang-cpp-15
export LD=/usr/bin/ld64.lld-15

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
  -DEIGEN_INCLUDE_DIR=$SOURCE_ROOT_DIR/eigen-3.4.0/install/include/eigen3 \
  -DBoost_DIR=$SOURCE_ROOT_DIR/boost_1_79_0/install/lib/cmake/Boost-1.79.0 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
  ..

make -j4

make install