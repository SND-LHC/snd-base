FROM cern/cc7-base:20171114

COPY install_dependencies.sh /tmp/install_dependencies.sh
RUN source /tmp/install_dependencies.sh

RUN pip install alibuild

RUN mkdir SHiPBuild

RUN git clone https://github.com/ShipSoft/shipdist.git SHiPBuild/shipdist

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build go Python-modules autotools\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build GCC-Toolchain\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build CMake protobuf\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build\
	lhapdf\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build\
	XercesC\
	ZeroMQ\
	boost\
	GSL\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build\
	log4cpp\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build\
	pythia6\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build\
	XRootD\
	googletest\
	nanomsg\
	HepMC\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build\
	GEANT4\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build\
	pythia\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild

RUN aliBuild -c shipdist/ --defaults fairship --chdir SHiPBuild build FairShip\
	&& aliBuild clean --aggressive-cleanup --chdir SHiPBuild
