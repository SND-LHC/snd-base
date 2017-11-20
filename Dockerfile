FROM cern/cc7-base

RUN yum -y install yum-plugin-ovl

COPY install_dependencies.sh /tmp/install_dependencies.sh
RUN source /tmp/install_dependencies.sh

RUN yum -y autoremove
RUN find /usr/share/locale | grep -v en | xargs rm -rf
RUN yum clean all
RUN rm -rf /var/cache/yum

RUN pip install pyyaml argparse

COPY SHiPBuild.sh /tmp/SHiPBuild.sh
RUN source /tmp/SHiPBuild.sh

RUN pip install scipy
