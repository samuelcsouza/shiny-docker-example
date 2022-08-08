# Shiny & Docker

<div align="center">
<img src="https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png" width="200" style="margin: 10px;"/>
<img src="https://raw.githubusercontent.com/rstudio/hex-stickers/master/thumbs/shiny.png" width="150" style="margin: 10px;"/>

</div>
<br/>

<p align="center">A simple example of how to using Shiny and Docker.</p>

## How to run

### Via R

1. Open RStudio or terminal on root project directory;

1. If you use *RStudio*, click on `RunApp` button. If you are in terminal, use the command:

    ```bash
    R -e "shiny::runApp()"
    ```

1. The link to your application will be show on terminal.

### Via Docker

1. On terminal, build your container with the command below:

    ```bash
    docker build -t shiny-docker .
    ```

    Where:
    - **shiny-docker** is the name of your container;
    - **. (dot)** is the path of the your application's `Dockerfile`.

1. verify if docker image has been builded listing all docker images with the command:

    ```bash
    docker images
    ```

1. After build the image, create a docker container using the command below:

    ```bash
    docker run -it -p 3838:3838 shiny-docker
    ```

    Where:
    - **-it** indicates that your container is interactive;
    - **-p** the port that your container is run (docker port : your machine port);
    - **shiny-docker** is the name of your container;

1. After run, go to [http://0.0.0.0:3838](http://0.0.0.0:3838) and enjoy!
