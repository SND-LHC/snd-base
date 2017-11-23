set -e
yum -y update
# yum -y groupinstall  "X Window System"
# yum -y install mesa-libGL mesa-libGL-devel
# yum -y install tigervnc-server vnc
# yum -y install tkinter
# yum -y install mesa-libglapi

yum -y install which file bc bash-completion man
yum -y install unzip patch
yum -y install cmake
yum -y install gcc-c++
yum -y install gcc-gfortran
yum -y install git subversion
yum -y install libX11-devel libXpm-devel libXext-devel libXft-devel
yum install -y libXmu-devel
# yum -y install xorg-x11-xauth libXmu-devel
yum -y install mesa-libGL-devel mesa-libGLU-devel
yum -y install expat-devel
yum -y install python-mtTkinter python-devel
yum -y install libxml2-devel
yum -y install redhat-lsb-core

# yum -y install x11vnc libpng xterm twm
yum -y install openssl openssl-devel openssl-CERN-CA-certs
yum -y install libcurl-openssl automake autoconf aclocal libcurl-devel libtool bzip2 bzip2-devel
yum -y install python2-pip
yum -y install bison{,-devel} flex{,-devel} environment-modules ncurses-devel
yum -y install perl-devel perl-ExtUtils-Embed
yum -y install libpng{,-devel}

yum -y autoremove
find /usr/share/locale | grep -v en | xargs rm -rf
yum clean all
rm -rf /var/cache/yum
