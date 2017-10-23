set -e

export SHIPSOFT=/opt
export FAIRROOTPATH=$SHIPSOFT/FairRootInst
export SIMPATH=$SHIPSOFT/FairSoftInst
export PYTHONPATH=$FAIRSHIP/python:$SIMPATH/lib:$SIMPATH/lib/Geant4:$PYTHONPATH

mkdir -p $SHIPSOFT

git clone -b master https://github.com/ShipSoft/FairRoot.git $SHIPSOFT/FairRoot
cd $SHIPSOFT/FairRoot
./configure.sh
