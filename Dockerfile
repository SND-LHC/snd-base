FROM ubuntu:17.10

COPY install_dependencies.sh /tmp/install_dependencies.sh
RUN sh /tmp/install_dependencies.sh

RUN pip install alibuild

RUN mkdir SHiPBuild

RUN git clone https://github.com/ShipSoft/shipdist.git SHiPBuild/shipdist

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build FairShip\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild\
	&& rm SHiPBuild/sw/MIRROR -r
