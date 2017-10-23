set -e

export SHIPSOFT=/opt

mkdir -p $SHIPSOFT

git clone -b master https://github.com/ShipSoft/FairSoft.git $SHIPSOFT/FairSoft
cd $SHIPSOFT/FairSoft
echo 1 | ./configure.sh

# clean up
rm $SHIPSOFT/FairSoftInst/share/genie
mv $SHIPSOFT/FairSoft/generators/genie-2.10.0/data $SHIPSOFT/FairSoftInst/share/genie
rm -rf $SHIPSOFT/FairSoft
