FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN apt-get update
RUN apt install bat

RUN pip3 install numpy
RUN pip3 install sympy
RUN pip3 install matplotlib

USER gitpod
# Apply user-specific settings

# Give back control
USER root