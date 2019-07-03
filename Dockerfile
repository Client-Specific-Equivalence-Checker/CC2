FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install build-essential curl libcap-dev git cmake libncurses5-dev python-minimal python-pip unzip libtcmalloc-minimal4 libgoogle-perftools-dev libsqlite3-dev -y
RUN apt-get install clang-6.0 llvm-6.0 llvm-6.0-dev llvm-6.0-tools -y
RUN git clone https://github.com/Z3Prover/z3
WORKDIR /z3
RUN apt-get install python3 -y
RUN python3 scripts/mk_make.py --python
WORKDIR /z3/build
RUN make && make install 
WORKDIR /
RUN git clone https://github.com/FedericoAureliano/klee 
WORKDIR /klee
RUN git checkout Nick
RUN mkdir build
WORKDIR /klee/build
RUN pip install lit && apt-get install doxygen zlib1g-dev -y
RUN cmake -DLLVM_CONFIG_BINARY=/usr/bin/llvm-config-6.0 .. -DENABLE_SOLVER_Z3=ON ..
RUN make install
WORKDIR /bin
ADD https://www.cprover.org/cbmc/download/cbmc-5-11-linux-64.tgz .
RUN tar xfz cbmc-5-11-linux-64.tgz && rm cbmc-5-11-linux-64.tgz
WORKDIR /
RUN apt install ninja-build lld-6.0 libboost-dev subversion gcc-multilib libgmp-dev libgmpxx4ldbl libgraphviz-dev ncurses-doc -y
RUN git clone https://github.com/seahorn/seahorn 
WORKDIR /seahorn
RUN git checkout deep-dev-5.0 && mkdir build 
WORKDIR /seahorn/build
RUN apt-get install libboost-all-dev -y
RUN cmake -DCMAKE_INSTALL_PREFIX=run -DCMAKE_BUILD_TYPE="Release" -DCMAKE_CXX_COMPILER="clang++-6.0" -DCMAKE_C_COMPILER="clang-6.0" -DSEA_ENABLE_LLD="ON" -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ../
RUN cmake --build .
RUN cmake --build . --target extra && cmake ..
RUN cmake --build . --target crab && cmake ..
RUN cmake --build . --target install
WORKDIR /
RUN apt-get install perl ocaml ocaml-findlib opam -y
RUN opam init 
RUN opam update 
RUN opam depext conf-m4.1
RUN opam install cil -y
RUN git clone https://github.com/cil-project/cil 
WORKDIR cil
RUN ./configure && make && make install
WORKDIR /
RUN git clone https://github.com/Client-Specific-Equivalence-Checker/CC2
WORKDIR /CC2 
RUN git checkout parallel-solving
WORKDIR /CC2/deps/mlscript
RUN make
WORKDIR /CC2  
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade pip 
RUN pip3 install setuptools 
RUN pip3 install pycparser 
RUN python3 setup.py install

WORKDIR /seahorn/build
ENV PATH="/seahorn/build/run/bin:${PATH}"
WORKDIR /
RUN mkdir testing
#RUN useradd -ms /bin/bash ccuser && echo ccuser:CC | chpasswd 
WORKDIR /CC2
USER root