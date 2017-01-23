
FROM ubuntu:xenial
MAINTAINER Rob Fugina <rfugina@wustl.edu>
ENV DEBIAN_FRONTEND noninteractive

# Update package lists and install updates
RUN apt-get update && apt-get -y upgrade && apt-get -y autoremove
RUN apt-get -y install apt-utils gcc git make vim

# Perl stuff I've decided that I need
RUN apt-get -y install \
  libdate-manip-perl \
  libdevel-dprof-perl \
  libdevel-profile-perl \
  libdevice-serialport-perl \
  libemail-simple-perl \
  libencode-perl \
  libfile-slurp-perl \
  libgraph-perl \
  libjson-perl \
  libmath-bigint-gmp-perl \
  libmath-bigint-perl \
  libmodule-build-perl \
  libnet-imap-simple-perl \
  libnet-imap-simple-ssl-perl \
  libnet-twitter-lite-perl \
  libnet-twitter-perl \
  libpar-dist-perl \
  libset-scalar-perl \
  libtest-deep-perl \
  libtest-pod-coverage-perl \
  libtest-pod-perl \
  libtime-hires-perl \
  libtime-parsedate-perl \
  libtime-stopwatch-perl \
  libwww-mechanize-perl \
  libwww-mechanize-shell-perl \
  libwww-wikipedia-perl \
  libyaml-perl \
  perl-doc

# Perl modules not available in binary packages
#RUN cpan Blah::Blah

## remove the stuff we don't need any more
#RUN apt-get -y remove --purge gcc make \
#  && apt-get -y autoremove \
#  && apt-get -y clean \
#  && rm -rf /var/lib/apt/lists/*

