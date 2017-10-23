set -e

export SHIPSOFT=/opt

mkdir -p $SHIPSOFT

git clone -b master https://github.com/ShipSoft/FairSoft.git $SHIPSOFT/FairSoft
cd $SHIPSOFT/FairSoft
echo 1 | ./configure.sh

# clean up
rm -rf $SHIPSOFT/FairSoft
