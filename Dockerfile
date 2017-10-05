FROM cern/cc7-base

RUN yum -y install yum-plugin-ovl

RUN echo "export SHIPSOFT=/opt" >> /root/.bash_profile
RUN echo "export FAIRROOTPATH=\$SHIPSOFT/FairRootInst" >> /root/.bash_profile
RUN echo "export SIMPATH=\$SHIPSOFT/FairSoftInst" >> /root/.bash_profile
RUN echo "export FAIRSHIP=\$SHIPSOFT/FairShip" >> /root/.bash_profile
RUN echo "export PYTHONPATH=\$FAIRSHIP/python:\$SIMPATH/lib:\$SIMPATH/lib/Geant4:\$PYTHONPATH" >> /root/.bash_profile

COPY install_dependencies.sh /tmp/install_dependencies.sh
RUN source /tmp/install_dependencies.sh

COPY build_FairSoft.sh /tmp/build_FairSoft.sh
RUN source /tmp/build_FairSoft.sh

COPY build_FairRoot.sh /tmp/build_FairRoot.sh
RUN source /tmp/build_FairRoot.sh

COPY build_FairShip.sh /tmp/build_FairShip.sh
RUN source /tmp/build_FairShip.sh

RUN yum -y autoremove
RUN find /usr/share/locale | grep -v en | xargs rm -rf
RUN yum clean all
