set -e
apt-get update -y
apt-get install -y python-dev python-pip make patch sed git-all gedit\
    environment-modules libx11-dev libxpm-dev libxext-dev ncurses-dev\
    libxml2-dev libxft-dev rsync libxmu-dev  ncurses-dev  curl bzip2\
    libbz2-dev gzip unzip tar gfortran libkrb5-dev wget automake autoconf\
    libtool bison  flex byacc libgif-dev libjpeg-dev libtiff5-dev\
    libexpat1-dev libcurl4-openssl-dev libssl-dev libbz2-dev libbz2-dev\
    libglu1-mesa libglu1-mesa-dev autopoint gettext \
    libtool-bin pkg-config python-tk cmake linuxbrew-wrapper
    texinfo

pip install --upgrade pip
pip install matplotlib numpy scipy certifi ipython ipywidgets ipykernel\
    notebook metakernel pyyaml
