FROM python:3.7.9

RUN apt-get update && apt-get install -y \
    git \
    && apt-get install -y sudo

RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
RUN apt-get install -y vim less

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm
ENV PATH $PATH:/home/research/.local/bin
RUN mkdir /.jupyter

ARG USERNAME=research
ARG GROUPNAME=research
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/

COPY ./config/requirements.txt ./requirements.txt
RUN mkdir /home/$USERNAME/works
RUN mkdir /home/$USERNAME/.jupyter

RUN pip install --upgrade pip \
    && pip install wheel \
    && pip install -r requirements.txt

COPY ./config/jupyter_notebook_config.py /home/$USERNAME/.jupyter/jupyter_lab_config.py