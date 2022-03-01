# ReportGenerator - Docker

This repo contains a [Dockerfile](Dockerfile) for generating [docker image](https://hub.docker.com/repository/docker/mbakala12/reportgenerator) that allows to use [ReportGenerator](https://github.com/danielpalme/ReportGenerator) nuget package.

## Running example
Assuming you have your XML report files called *OpenCover.xml* inside the *source* directory you can generate the HTML report that will be stored in *html* folder by using the following command:
```
docker run --rm -v $(pwd)/source:/app/coverage -v $(pwd)/html:/app/html mbakala12/reportgenerator "-reports:coverage/OpenCover.xml" "-targetDir:html" "-reporttypes:Html" 
```
For more information how to use and which parameters provide go to [ReportGenerator](https://github.com/danielpalme/ReportGenerator)