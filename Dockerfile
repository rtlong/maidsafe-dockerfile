FROM stackbrew/ubuntu:13.10

RUN apt-get update

RUN apt-get install -y build-essential libpython-all-dev python-psutil python-requests libfuse-dev git-all cmake libicu-dev g++-4.8 valgrind binutils-gold

RUN git clone git://cmake.org/cmake.git /opt/cmake \
 && cd /opt/cmake \
 && git checkout v2.8.12.1 \
 && ./bootstrap --prefix=/usr \
 && make \
 && make install

ADD MaidSafe /opt/maidsafe_src

RUN cmake -H/opt/maidsafe_src -B/opt/maidsafe_build
RUN cmake --build /opt/maidsafe_build --config Debug

