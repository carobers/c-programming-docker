FROM alpine:latest AS cdevbase

# Download bare-needed packages
RUN \
    --mount=type=cache,target=/var/cache/apk/ \
    --mount=type=cache,target=/var/lib/apk/ \
    --mount=type=cache,target=/etc/apk/cache/ \
    apk update && apk add make gcc g++ musl-dev lzlib-dev zlib-static zlib-dev

#  Build HDF5 Library
FROM cdevbase AS hdf5build
COPY deps deps
RUN \
    cd /deps \
    && tar -zvxf hdf5-1.14.3.tar.gz \
    && cd /deps/hdf5-1.14.3/ \
    && ./configure --prefix=/usr/local/ \
    && make -j \
    && make install

# Done I guess
WORKDIR /workspace