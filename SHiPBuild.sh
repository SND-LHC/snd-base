set -e

export SHIPSOFT=/SHiPBuild

mkdir -p $SHIPSOFT && cd $SHIPSOFT

git clone -b master https://github.com/ShipSoft/FairShip.git $SHIPSOFT/FairShip
{
    cd $SHIPSOFT/FairShip
    # git checkout 9536ea46edcb225c5aba88c3ba1d94b284e6d34
}
cd $SHIPSOFT
FairShip/aliBuild.sh
alibuild/aliBuild clean --aggressive-cleanup
