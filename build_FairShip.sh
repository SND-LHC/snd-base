set -e

export SHIPSOFT=/opt
export FAIRROOTPATH=$SHIPSOFT/FairRootInst
export SIMPATH=$SHIPSOFT/FairSoftInst
export FAIRSHIP=$SHIPSOFT/FairShip
export PYTHONPATH=$FAIRSHIP/python:$SIMPATH/lib:$SIMPATH/lib/Geant4:$PYTHONPATH

mkdir -p $SHIPSOFT

git clone https://github.com/ShipSoft/FairShip.git $FAIRSHIP -b Oct17-ship
cd $FAIRSHIP
./configure.sh
