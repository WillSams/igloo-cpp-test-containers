# C++ Unit Testing Containers

Collection of Docker containers for unit testing my C++ game development projects using [Igloo](https://github.com/codewars/igloo).  

Useful if you want to run your unit tests in a CI/CD pipeline.  Just use these as a base container and copy your files over to test.

For example, your Dockerfile may look like the following after you've push your image to GitHub:

```Dockerfile
FROM yourdockerusername/igloo-testing:latest as base

# Copy the source code into the container
RUN mkdir -p /opt/yourproject
COPY ./common /opt/yourproject/common
COPY ./vendor /opt/yourproject/vendor
COPY ./specs /opt/yourproject/specs
COPY ./Makefile.switch /opt/yourproject/Makefile
COPY ./base.mk /opt/yourproject/base.mk

# Test the project
WORKDIR /opt/yourproject
RUN make test
```
