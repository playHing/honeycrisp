FROM ubuntu:16.04
WORKDIR /root
RUN apt-get update && apt-get install -y \
  bzip2 \
  doxygen \
  g++ \
  gcc \
  git \
  libgmp3-dev \
  m4 \
  make \
  patch \
  python \
  tmux \
  vim \
  wget \
  yasm

ADD source/ /root/source
ADD config/ /root/config
ADD depends.sh .
RUN ["bash", "depends.sh"]

ADD SMtweaks/ /root/SMtweaks
ADD test/ /root/test
ADD install.sh .
RUN ["bash", "install.sh"]

ADD README.md .

CMD ["/bin/bash"]
