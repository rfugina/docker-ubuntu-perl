
FROM ubuntu:xenial
MAINTAINER Rob Fugina <rfugina@wustl.edu>
ENV DEBIAN_FRONTEND noninteractive

# Update package lists and install updates
RUN sed -e 's/^deb-src/# deb-src/' -i /etc/apt/sources.list \
  && sed -e 's/^# deb /deb /' -i /etc/apt/sources.list \
  && apt-get update && apt-get -y upgrade && apt-get -y autoremove \
  && apt-get -y install apt-utils gcc g++ git make man vim

# Perl stuff I've decided that I need
RUN apt-get -y install \
  libcrypt-smbhash-perl \
  libdate-manip-perl \
  libdbd-csv-perl \
  libdbd-pg-perl \
  libdevel-dprof-perl \
  libdevel-profile-perl \
  libdevice-serialport-perl \
  libemail-simple-perl \
  libencode-perl \
  libfile-homedir-perl \
  libfile-slurp-perl \
  libfile-touch-perl \
  libgmp-dev \
  libgraph-perl \
  libio-prompt-perl \
  libio-pty-perl \
  libjira-client-automated-perl \
  libjson-perl \
  libmath-bigint-gmp-perl \
  libmath-bigint-perl \
  libmath-gmp-perl \
  libmath-prime-util-gmp-perl \
  libmath-prime-util-perl \
  libmodule-build-perl \
  libmoose-perl \
  libnet-imap-simple-perl \
  libnet-imap-simple-ssl-perl \
  libnet-ldap-perl \
  libnet-openssh-perl \
  libnet-ssh2-perl \
  libnet-twitter-lite-perl \
  libnet-twitter-perl \
  libpar-dist-perl \
  libpoe-perl \
  libppi-perl \
  libset-scalar-perl \
  libsub-uplevel-perl \
  libterm-progressbar-perl \
  libterm-readpassword-perl \
  libtest-deep-perl \
  libtest-exception-perl \
  libtest-pod-coverage-perl \
  libtest-pod-perl \
  libtext-csv-perl \
  libtime-hires-perl \
  libtime-parsedate-perl \
  libtime-progress-perl \
  libtime-stopwatch-perl \
  libur-perl \
  libwww-mechanize-perl \
  libwww-mechanize-shell-perl \
  libwww-wikipedia-perl \
  libxml-simple-perl \
  libyaml-perl \
  perl-doc

# Perl modules not available in binary packages
RUN cpan Math::GMPq Math::GMPz Math::GMPf Parallel::Forker
RUN cpan \
  Amazon::SNS \
  Math::Factoring \
  Module::Build::Convert \
  Net::IMAP::Simple::Gmail \
  Net::SSH2::Cisco \
  Paws

WORKDIR /root

## remove the stuff we don't need any more
#RUN apt-get -y remove --purge gcc make \
#  && apt-get -y autoremove \
#  && apt-get -y clean \
#  && rm -rf /var/lib/apt/lists/*

