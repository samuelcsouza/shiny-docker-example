FROM rocker/r-ubuntu

LABEL maintainer="Samuel Souza"

# R dependencies for linux base image
RUN apt-get update && apt-get upgrade -y && apt-get install -y libxml2-dev

# R packages
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'waiter'), \
  repos = 'https://cloud.r-project.org/')"

# Environment variables
ENV PROJECT_NAME='Docker Container'

RUN mkdir /root/shiny-docker

COPY . /root/shiny-docker

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/root/shiny-docker', port = 3838, host = '0.0.0.0')"]
