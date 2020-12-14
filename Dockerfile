FROM cern/cc7-base:20201116-1.x86_64


RUN yum -y update \
    && yum -y install \
    which \
    file \
    bc \
    bash-completion \
    unzip \
    patch \
    gcc-{c++,gfortran} \
    git \
    subversion \
    libX11-devel \
    libXpm-devel \
    libXext-devel \
    libXft-devel \
    libXmu-devel \
    mesa-libGL-devel \
    mesa-libGLU-devel \
    mesa-dri-drivers \
    expat-devel  \
    python-devel \
    libxml2-devel \
    redhat-lsb-core \
    openssl \
    openssl-devel \
    libcurl-openssl \
    automake \
    texinfo \
    gettext{,-devel} \
    autoconf \
    libtool \
    libcurl-devel \
    bzip2 \
    bzip2-devel \
    python3-{pip,devel} \
    bison{,-devel} \
    flex{,-devel} \
    environment-modules \
    ncurses-devel \
    perl-devel \
    perl-ExtUtils-Embed \
    libpng-devel \
    sqlite-devel \
    dejavu-lgc-sans-fonts \
    tk{,-devel} \
    tcl-devel \
    && yum -y autoremove \
    && find /usr/share/locale | grep -v en | xargs rm -rf \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && pip3 install alibuild

RUN git clone https://github.com/SND-LHC/snddist.git

RUN aliBuild analytics off && \
    aliBuild \
    -c snddist/ \
    build GCC-Toolchain

RUN aliBuild analytics off && \
    aliBuild \
    -c snddist/ \
    build GEANT4

RUN aliBuild analytics off && \
    aliBuild \
    -c snddist/ \
    build ROOT

RUN aliBuild \
    -c snddist/ \
    build FairRoot alpaca EvtGen GENIE \
    --no-local ROOT
