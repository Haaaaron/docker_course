FROM ubuntu:22.04 as build-stage
LABEL Description="HILA environment"

ENV LLVM_VERSION 15
SHELL ["/bin/bash", "-c"]

#installing base dependencies and clang dependencies
RUN apt-get -y update && apt-get -y install build-essential \
            libopenmpi-dev \
            libfftw3-dev \
            libomp-dev \
            git \
            make && \
    apt-get -y update && apt-get -y install clang-$LLVM_VERSION \
                       libclang-$LLVM_VERSION-dev

#installing hilapp
RUN cd / && \
    git clone https://github.com/CFT-HY/HILA && \
    cd /HILA/hilapp && \
    make -j4 static && make install

RUN useradd -ms /bin/bash appuser

FROM scratch

COPY --from=build-stage /HILA/hilapp/bin/hilapp /
COPY --from=build-stage /etc/passwd /etc/passwd
USER appuser

ENTRYPOINT [ "/hilapp" ]