###########################################################################
# :AUTHOR: Katarzyna Ewa Lewinska  [lewinska@hu-berlin.de]
# :DATE: 14 March 2023
#
# :Description: A Docker image for a container to run remotePARTS
#
# :Updates:
#
# :2Do:
#
# :Disclaimer:  The author of this code accepts no responsibility for errors or omissions in this work
#               and shall not be liable for any damage caused by these.
###########################################################################

FROM r-base:4.2.2

# disable interactive frontends
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y \
  libcurl4-openssl-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libfribidi-dev \
  libharfbuzz-dev \
  libjpeg-dev \
  libpng-dev \
  libssh2-1-dev \
  libssl-dev \
  libtiff5-dev \
  libxml2-dev \
  zlib1g-dev \
  cmake
RUN Rscript -e "install.packages(c('devtools', 'dplyr'))"
RUN Rscript -e "devtools::install_github("morrowcj/remotePARTS")"

    # Clear installation data
    # apt-get clean && rm -r /var/cache/

ENV HOME /home/docker
# ENV PATH "$PATH:/home/docker/bin"

WORKDIR /home/docker

# CMD [R]
