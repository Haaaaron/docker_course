I have implemented a docker container for our research groups simulation software HILA https://github.com/CFT-HY/HILA

The preprocessor hilapp is a tool used by the HILA software to convert generic templated cpp code into a target architecture like CUDA or MPI etc.

I created a dockerfile specifically for this hilapp preprocessor that then uses `FROM scratch` to copy the statically built binary hilapp into a lone container. The container shrunk from 2GB to 95MB 

The Dockerfile before the changes was 

```
FROM ubuntu:22.04
LABEL Description="HILA environment"

ENV LLVM_VERSION 15
SHELL ["/bin/bash", "-c"]

#installing base dependencies
RUN apt-get -y update && apt-get -y install build-essential \
            libopenmpi-dev \
            libfftw3-dev \
            libomp-dev \
            git \
            make

#installing clang dependencies for hilapp
# RUN apt-get -y update && apt-get -y install clang-$LLVM_VERSION \
#                        llvm-$LLVM_VERSION \
#                        clang-tools-$LLVM_VERSION \
#                        libclang-common-$LLVM_VERSION-dev \
#                        libclang-cpp$LLVM_VERSION-dev \
#                        libclang-$LLVM_VERSION-dev \
#                        clang-format-$LLVM_VERSION

#installing clang dependencies for hilapp
RUN apt-get -y update && apt-get -y install clang-$LLVM_VERSION \
                       libclang-$LLVM_VERSION-dev

#installing hilapp
RUN cd / && \
    git clone https://github.com/CFT-HY/HILA && \
    cd /HILA/hilapp && \
    make -j4 && make install
```

Exedcuting the container yields:

```
    $ docker run hilapp
    /hilapp: no input files specified
```

which is expected behavior. Passing a `.cpp` file to the project has not been tested, but the point was just to see if `hilapp` would compile and run, which is the case.