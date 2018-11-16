FROM cern/cc7-base:20180516

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
    python2-pip \
    bison{,-devel} \
    flex{,-devel} \
    environment-modules \
    ncurses-devel \
    perl-devel \
    perl-ExtUtils-Embed \
    libpng{,-devel} \
    dejavu-lgc-sans-fonts \
    && yum -y autoremove \
    && find /usr/share/locale | grep -v en | xargs rm -rf \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && pip install alibuild

RUN git clone https://github.com/ShipSoft/shipdist.git

RUN aliBuild -c shipdist/ --defaults fairship build FairRoot GENIE EvtGen --no-local ROOT \
	&& aliBuild clean --aggressive-cleanup
