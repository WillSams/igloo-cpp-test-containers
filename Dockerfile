FROM debian:latest

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    build-essential \
    xutils-dev \
    libsdl2-dev \
    libsdl2-gfx-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-net-dev \
    libsdl2-ttf-dev \
    libreadline6-dev \
    libncurses5-dev \
    mingw-w64 \
    git \
    cmake \
    libtinyxml2-dev \
    tiled \
    valgrind \
    liblua5.3-dev

# Install the Igloo testing framework
RUN git clone --recursive https://github.com/codewars/igloo.git /opt/igloo
RUN sed -i 's/\VERSION 3.22/VERSION 3.18/g' /opt/igloo/CMakeLists.txt

WORKDIR /opt/igloo
RUN git submodule add -b headers-only https://github.com/banditcpp/snowhouse snowhouse
RUN git submodule update --init --recursive
RUN mkdir /opt/igloo/build

WORKDIR /opt/igloo/build
RUN cmake ..
RUN cmake --build . --target install