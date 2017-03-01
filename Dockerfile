
FROM ubuntu:xenial
MAINTAINER Rob Fugina <rfugina@wustl.edu>
ENV DEBIAN_FRONTEND noninteractive

# Update package lists and install updates
RUN sed -e 's/^deb-src/# deb-src/' -i /etc/apt/sources.list \
  && sed -e 's/^# deb /deb /' -i /etc/apt/sources.list \
  && apt-get update && apt-get -y upgrade && apt-get -y autoremove \
  && apt-get -y install apt-utils gcc git make man vim

# Perl stuff I've decided that I need
RUN apt-get -y install \
  libdate-manip-perl \
  libdbd-csv-perl \
  libdevel-dprof-perl \
  libdevel-profile-perl \
  libdevice-serialport-perl \
  libemail-simple-perl \
  libencode-perl \
  libfile-homedir-perl \
  libfile-slurp-perl \
  libgmp-dev \
  libgraph-perl \
  libio-prompt-perl \
  libio-pty-perl \
  libjson-perl \
  libmath-bigint-gmp-perl \
  libmath-bigint-perl \
  libmodule-build-perl \
  libnet-imap-simple-perl \
  libnet-imap-simple-ssl-perl \
  libnet-ldap-perl \
  libnet-openssh-perl \
  libnet-twitter-lite-perl \
  libnet-twitter-perl \
  libpar-dist-perl \
  libppi-perl \
  libset-scalar-perl \
  libtest-deep-perl \
  libtest-pod-coverage-perl \
  libtest-pod-perl \
  libtime-hires-perl \
  libtime-parsedate-perl \
  libtime-stopwatch-perl \
  libtime-stopwatch-perl \
  libwww-mechanize-perl \
  libwww-mechanize-shell-perl \
  libwww-wikipedia-perl \
  libyaml-perl \
  perl-doc

# Perl modules not available in binary packages
RUN cpan Module::Build::Convert Math::Factoring

## remove the stuff we don't need any more
#RUN apt-get -y remove --purge gcc make \
#  && apt-get -y autoremove \
#  && apt-get -y clean \
#  && rm -rf /var/lib/apt/lists/*

