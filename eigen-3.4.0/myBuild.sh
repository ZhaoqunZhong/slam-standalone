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
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
  -DBUILD_SHARED_LIBS=ON \
  -DBoost_DIR=${SOURCE_ROOT_DIR}/boost_1_79_0/stage/lib/cmake/Boost-1.79.0 \
  -DCHOLMOD_INCLUDES=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/include/suitesparse \
  -DUMFPACK_INCLUDES=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/include/suitesparse \
  -DKLU_INCLUDES=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/include/suitesparse \
  -DSPQR_INCLUDES=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/include/suitesparse \
  -DLIB_INSTALL_DIR=$SOURCE_ROOT_DIR/suitesparse-metis-for-windows/install/lib \
  ..

make -j6

make install
