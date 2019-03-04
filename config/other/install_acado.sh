sudo apt-get install -y gcc g++ cmake git gnuplot doxygen graphviz
git clone https://github.com/acado/acado.git -b stable ACADOtoolkit

cd ACADOtoolkit
mkdir build
cd build

cmake ..
make

cd ..
cd examples/getting_started
./simple_ocp