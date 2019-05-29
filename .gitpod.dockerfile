FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN apt-get update && apt-get install -y \
  ... \
  && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN apt install bat

RUN pip3 install numpy
RUN pip3 install sympy
RUN pip3 install matplotlib

USER gitpod
# Apply user-specific settings

# Give back control
USER root