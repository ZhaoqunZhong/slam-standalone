
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



cmake -Duse_CLANG=ON \
  -DCMAKE_CXX_STANDARD=17 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
  -DBUILD_SHARED_LIBS=ON \
  ..

make -j4

make install