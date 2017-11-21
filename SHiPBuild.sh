set -e

export SHIPSOFT=/SHiPBuild

pip install alibuild

pip install matplotlib scipy certifi IPython==5.* ipywidgets metakernel

mkdir -p $SHIPSOFT && cd $SHIPSOFT

git clone https://github.com/ShipSoft/shipdist.git

aliBuild -c shipdist/ --defaults fairship build FairShip
aliBuild clean --aggressive-cleanup
