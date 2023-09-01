###########################################################################
# :AUTHOR: Katarzyna Ewa Lewinska  [lewinska@hu-berlin.de]
# :DATE: 14 March 2023
#
# :Description: A Docker image for a container to run remotePARTS
#
# :Updates:     2023-08-31:   r-base:4.3.1; add 'sp', 'sf', and 'terra' R packages 
#
# :2Do:
#
# :Disclaimer:  The author of this code accepts no responsibility for errors or omissions in this work
#               and shall not be liable for any damage caused by these.
###########################################################################

FROM r-base:4.3.1

WORKDIR /home/docker

# disable interactive frontends
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y upgrade && \
  apt-get install -y \
  libcurl4-openssl-dev \
  libfontconfig1-dev \
  libfreetype-dev \
  libfreetype-dev \
  libudunits2-dev \
  libgeos-dev \
  libproj-dev \
  libfribidi-dev \
  libgdal-dev \
  libharfbuzz-dev \
  libjpeg-dev \
  libpng-dev \
  libssh2-1-dev \
  libssl-dev \
  libtiff5-dev \
  libxml2-dev \
  zlib1g-dev \
  cmake

RUN Rscript -e "install.packages(c('devtools', 'dplyr'))" && \
    Rscript -e "devtools::install_github('morrowcj/remotePARTS')" && \
    Rscript -e "install.packages(c('snow', 'parallel', 'doParallel', 'foreach', 'graphics'))" && \

    Rscript -e "install.packages(c('raster', 'sp', 'terra','data.table', 'rgdal'), dependencies = TRUE, repos = 'https://cloud.r-project.org')" && \
    Rscript -e "devtools::install_github('r-spatial/sf')" && \
    
    # Clear installation data
    apt-get clean && rm -r /var/cache/

USER docker

# ENV HOME /home/docker
# ENV PATH /home/docker/bin

# Entry point
CMD ["Rscript"]
