DIRECTORY='install'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  rm -r install
fi

DIRECTORY='build'
if [ -d "$DIRECTORY" ]; then
  # echo "build folder exists"
  cd build
  rm -r *
else
  mkdir build
  cd buildldd
fi

cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
  -DBUILD_SHARED_LIBS=ON \
  ..

make -j6

make install