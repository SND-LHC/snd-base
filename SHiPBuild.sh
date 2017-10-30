set -e

export SHIPSOFT=SHiPBuild

mkdir -p $SHIPSOFT && cd $SHIPSOFT

git clone -b master https://github.com/ShipSoft/FairShip.git $SHIPSOFT/FairShip
{
    cd $SHIPSOFT/FairShip
    git checkout v2-10
}
FairShip/alibuild.sh
alibuild/aliBuild clean --aggressive-cleanup
