set -e

export SHIPSOFT=/opt
export FAIRROOTPATH=$SHIPSOFT/FairRootInst
export SIMPATH=$SHIPSOFT/FairSoftInst
export FAIRSHIP=$SHIPSOFT/FairShip
export PYTHONPATH=$FAIRSHIP/python:$SIMPATH/lib:$SIMPATH/lib/Geant4:$PYTHONPATH

mkdir -p $SHIPSOFT

git clone -b master https://github.com/ShipSoft/FairSoft.git $SHIPSOFT/FairSoft
cd $SHIPSOFT/FairSoft
echo 1 | ./configure.sh

git clone -b master https://github.com/ShipSoft/FairRoot.git $SHIPSOFT/FairRoot
cd $SHIPSOFT/FairRoot
# export PATH=$SIMPATH/bin:$PATH
# mkdir build
# cd build
# cmake .. -DCMAKE_INSTALL_PREFIX=$FAIRROOTPATH -DUSE_DIFFERENT_COMPILER=TRUE
# make
# make install
./configure.sh

git clone https://github.com/ShipSoft/FairShip.git $FAIRSHIP
cd $FAIRSHIP
git checkout tag/v2-10
./configure.sh
# mkdir -p $FAIRSHIP/../FairShipRun
# cd $FAIRSHIP/../FairShipRun
# cmake $FAIRSHIP -DCMAKE_INSTALL_PREFIX=$(pwd) -DCMAKE_CXX_COMPILER=$($SIMPATH/bin/fairsoft-config --cxx) -DCMAKE_C_COMPILER=$($SIMPATH/bin/fairsoft-config --cc)
# make

# cleanup
rm -rf $SHIPSOFT/FairSoft
rm -rf $SHIPSOFT/FairRoot
