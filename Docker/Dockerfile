# docker build -t andreagia/nmrpipecwl .

FROM ubuntu
LABEL Andrea Giachetti <giachetti@cerm.unifi.it>

# Update relax for python version 2.7. http://www.nmr-relax.com
RUN dpkg --add-architecture i386

RUN  apt-get -y update && \
    # dont install csh is very slow
    #apt-get -y install csh && \
    apt-get -y install tcsh && \
    apt-get -y install libc6:i386 && \
    apt-get -y install libstdc++6:i386 && \
    apt-get -y install libx11-6:i386 && \
    apt-get -y install libxext6:i386 && \
    apt-get -y install msttcorefonts && \
    apt-get -y install default-jre && \
    apt-get -y install default-jdk  && \
    apt-get -y install wget
# Make default folders
# Stop Gtk-WARNING with .local/share
ENV USER nmrpipe
RUN groupadd --gid 1000 $USER \
    && useradd --uid 1000 --gid $USER --shell /bin/tcsh --create-home $USER
ENV HOME /home/$USER
#USER $USER
RUN mkdir -p /opt/software && \
    mkdir -p /opt/software
ENV NMRPIPES /opt/software/NMRPipe
COPY NMRPIPE /opt/software/NMRPipe
RUN cd $HOME && \
    echo "Installing NMRPipe" && \
    #mkdir -p $HOME/software/NMRPipe && \
    cd $NMRPIPES && \
    #cp $HOME/NMRPIPE/* ./ && \
    #wget https://www.ibbr.umd.edu/nmrpipe/install.com && \
    #wget https://www.ibbr.umd.edu/nmrpipe/binval.com && \
    #wget https://www.ibbr.umd.edu/nmrpipe/NMRPipeX.tZ && \
    #wget https://www.ibbr.umd.edu/nmrpipe/s.tZ && \
    #wget https://www.ibbr.umd.edu/nmrpipe/dyn.tZ && \
    #wget https://spin.niddk.nih.gov/bax/software/talos_nmrPipe.tZ && \
    #wget https://spin.niddk.nih.gov/bax/software/smile/plugin.smile.tZ && \
    #curl -O https://www.ibbr.umd.edu/nmrpipe/install.com && \
    #curl -O https://www.ibbr.umd.edu/nmrpipe/binval.com && \
    #curl -O https://www.ibbr.umd.edu/nmrpipe/NMRPipeX.tZ && \
    #curl -O https://www.ibbr.umd.edu/nmrpipe/s.tZ && \
    #curl -O https://www.ibbr.umd.edu/nmrpipe/dyn.tZ && \
    #curl -O https://www.ibbr.umd.edu/nmrpipe/talos_nmrPipe.tZ && \
    #curl -O https://spin.niddk.nih.gov/bax/software/smile/plugin.smile.tZ && \
    chmod a+r NMRPipeX.tZ && \
    chmod a+r s.tZ && \
    chmod a+r dyn.tZ && \
    chmod a+r talos_nmrPipe.tZ && \
    chmod a+r plugin.smile.tZ && \
    chmod a+rx install.com && \
    chmod a+rx binval.com && \
    chmod a+wrx /opt && \
    chmod a+wrx /opt/software && \
    chmod a+wrx /opt/software/NMRPipe 

    #touch $HOME/.cshrc
USER $USER
RUN tcsh && \
    cd $NMRPIPES && \
    ./install.com && \
    echo "Completed installation"
# Made from: source $HOME/software/NMRPipe/com/nmrInit.linux212_64.com
# ENV NMRBASE=$HOME/software/NMRPipe
# ENV PATH="$NMRBASE/nmrbin.linux212_64:$NMRBASE/com:${PATH}"
# ENV NMR_IO_TIMEOUT=0
# ENV NMR_IO_SELECT=0
# ENV NMR_AUTOSWAP=1
# ENV NMR_PLUGIN_FN=SMILE
# ENV NMR_PLUGIN_EXE=nusPipe
# ENV NMR_PLUGIN_INFO="-nDim -sample sName ... MD NUS Reconstruction"
# ENV MANPATH=$NMRBASE/man:/usr/share/man:/usr/local/man:${MANPATH}
# ENV MANPATH=$NMRBASE/man:/usr/share/man:/usr/local/man
# ENV LD_LIBRARY_PATH=$NMRBASE/nmrbin.linux212_64/lib:${LD_LIBRARY_PATH}
# #ENV LD_LIBRARY_PATH=$NMRBASE/nmrbin.linux212_64/lib
# ENV OPENWINHOME=$NMRBASE/nmrbin.linux212_64/openwin
# ENV NMR_CHECKARGS=ALL
# ENV NMR_FSCHECK=NO
# ENV NMRBINTYPE=linux212_64
# ENV NMRTXT=$NMRBASE/nmrtxt
# ENV NMRBIN=$NMRBASE/nmrbin.linux212_64
# ENV TCLPATH=$NMRBASE/com
# ENV TALOS_DIR=$NMRBASE/talos
# ENV TALOSP_DIR=$NMRBASE/talosplus
# ENV TALOSN_DIR=$NMRBASE/talosn
# ENV SPARTAP_DIR=$NMRBASE/spartaplus
# ENV PROMEGA_DIR=$NMRBASE/promega
# ENV NMR_TCLTK8=TRUE
# ENV TCL_LIBRARY=$NMRBASE/nmrtcl/tcl8.4
# ENV TK_LIBRARY=$NMRBASE/nmrtcl/tk8.4
# ENV BLT_LIBRARY=$NMRBASE/nmrtcl/blt2.4
# ENV NMRPIPE_TCL_LIB=$NMRBASE/nmrtcl/tcl8.4
# ENV NMRPIPE_TK_LIB=$NMRBASE/nmrtcl/tk8.4
# ENV NMRPIPE_BLT_LIB=$NMRBASE/nmrtcl/blt2.4
# # Made from: source $HOME/software/NMRPipe/dynamo/com/dynInit.com
# ENV DYNAMO_KEY=2002084
# ENV DYNAMO_DIR=$NMRBASE/dynamo
# ENV DYNAMO_PARAMS=$NMRBASE/dynamo/params
# ENV SURF_DIR=$NMRBASE/dynamo/surface
# ENV PDBH_BASE=$NMRBASE/pdb
# ENV PDBH_DIR=$PDBH_BASE/pdbH
# ENV PDBH_LIST=$PDBH_BASE/pdbH.list
# ENV PDBH_TAB=$PDBH_BASE/resolution.tab
#!/bin/csh -f


# NMRPipe System Environment script, Wed Dec 4 09:29:26 UTC 2019.



# Standard Expiration Override:
# ENV NMR_CONT CORRECT_ALL


# NMRPipe I/O Optimization.
# These settings may improve NMRPipe pipeline performance:

ENV NMR_IO_TIMEOUT 0
ENV NMR_IO_SELECT  0
ENV NMR_AUTOSWAP   1

#
# NMRPipe Plugins:
ENV NMR_PLUGIN_FN    SMILE
ENV NMR_PLUGIN_EXE   nusPipe
ENV NMR_PLUGIN_INFO  "-nDim -sample sName ... MD NUS Reconstruction"

#
# Useful definitions:
#alias u      'chmod a+rx *.com *.tcl'

#set   history = 256
#alias h      'history'
#alias rm     'rm -i'
#alias cd     'cd \!*; set prompt = "$cwd% "'
#alias dirs   'ls -l | egrep -e ^d'
#alias links  'ls -l | egrep -e ^l'


ENV MANPATH ${NMRPIPES}/man:/usr/share/man:/usr/local/man


ENV  PATH="${NMRPIPES}/nmrbin.linux212_64:${NMRPIPES}/com:${PATH}"



ENV LD_LIBRARY_PATH ${NMRPIPES}/nmrbin.linux212_64/lib




ENV OPENWINHOME ${NMRPIPES}/nmrbin.linux212_64/openwin


ENV NMR_CHECKARGS   ALL
ENV NMR_FSCHECK     NO
ENV NMRBASE         ${NMRPIPES}
ENV NMRBINTYPE      linux212_64
ENV NMRTXT          ${NMRPIPES}/nmrtxt
ENV NMRBIN          ${NMRPIPES}/nmrbin.linux212_64
ENV TCLPATH         ${NMRPIPES}/com
ENV TALOS_DIR       ${NMRPIPES}/talos
ENV TALOSP_DIR      ${NMRPIPES}/talosplus
ENV TALOSN_DIR      ${NMRPIPES}/talosn
ENV SPARTAP_DIR     ${NMRPIPES}/spartaplus
ENV PROMEGA_DIR     ${NMRPIPES}/promega


ENV NMR_TCLTK8      TRUE
ENV TCL_LIBRARY     ${NMRPIPES}/nmrtcl/tcl8.4
ENV TK_LIBRARY      ${NMRPIPES}/nmrtcl/tk8.4
ENV BLT_LIBRARY     ${NMRPIPES}/nmrtcl/blt2.4
ENV NMRPIPE_TCL_LIB ${NMRPIPES}/nmrtcl/tcl8.4
ENV NMRPIPE_TK_LIB  ${NMRPIPES}/nmrtcl/tk8.4
ENV NMRPIPE_BLT_LIB ${NMRPIPES}/nmrtcl/blt2.4

# # ENV NMRPIPE_SMALLFONT  "-adobe-helvetica-medium-r-*-*-*-100-*-*-*-*-*-*"
# # ENV NMRPIPE_BIGFONT    "-adobe-helvetica-medium-r-*-*-*-180-*-*-*-*-*-*"
# # ENV NMRPIPE_STDFONT    "-adobe-helvetica-medium-r-*-*-*-120-*-*-*-*-*-*"
# # ENV NMRPIPE_BOLDFONT   "-adobe-helvetica-bold-r-*-*-*-120-*-*-*-*-*-*"
# # ENV NMRPIPE_FIXEDFONT  "-*-courier-medium-r-*-*-*-120-*-*-*-*-*-*"
# # ENV NMRPIPE_TYPINGFONT "-*-courier-medium-r-*-*-*-100-*-*-*-*-*-*"
# # ENV NMRPIPE_AXISFONT   "-*-lucidatypewriter-bold-r-*-*-*-120-*-*-*-*-*-*"

#RUN alias u 'chmod a+rx *.com *.tcl'

RUN echo source $NMRPIPES/com/nmrInit.linux212_64.com > $HOME/.tcshrc
RUN mkdir $HOME/work
RUN tcsh
#ENV  PATH="${NMRPIPES}/nmrbin.linux212_64:${NMRPIPES}/com:${PATH}"
WORKDIR $HOME/work
