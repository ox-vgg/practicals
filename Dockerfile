## Dockerfile to setup JupyterHub for the vgg practicals.
##
##
## The VGG practicals now run on the AIMS servers which has an
## instance of JupyterHub.  Previously, we ran the practicals on our
## own servers and would setup a temporary JupyterHub instance with
## docker each time.  This Dockerfile can be used to reproduce it if
## we ever need it again.
##
## After building the docker image, it is required to "enter" the
## image and set the password for the vgg user.
##
##   $ cd vg-practicals
##   $ for PRACTICAL_NAME in category-recognition-cnn-pytorch \
##   >                       cnn-pytorch \
##   >                       object-category-detection-pytorch ; \
##   > do
##   >   tar xzf ${PRACTICAL_NAME}/datar.tar.gz -C $PRACTICAL_NAME
##   >   rm ${PRACTICAL_NAME}/datar.tar.gz
##   > done
##   $ docker build --tag vgg-practicals .
##   $ docker run \
##   >        --detach
##   >        --gpus 'all' \
##   >        --name vgg-practicals \
##   >        --publish 8000:8000 \
##   >        vgg-practicals
##   $ docker exec -it vgg-practicals bash
##   # passwd vgg
##   New password:
##   Retype new password:
##   passwd: password updated successfully
##   # exit
##
## Other users (students and instructors) can be added via the
## JupyterHub admin interface and by default their password will be
## the same as their username (we recommend that they change it soon).
##
## Note on SSL: we do not bother with setting up SSL on the image
## because this sits behind a proxy and we have encryption set at that
## point.

## DockerHub has images for CUDA and for jupyterhub but not one with
## both.  It is not possible to merge two images we have to do it
## ourselves.  So we base it on the CUDA images with cuDNN and install
## JupyterHub on top of it.

FROM nvidia/cuda:11.5.1-cudnn8-devel-ubuntu20.04

USER root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install --yes --quiet --no-install-recommends \
               python3-pip \
               nodejs \
               npm \
               imagemagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## version 4.5.0 of configurable-http-proxy is incompatible with the
## nodejs version in Ubuntu 20.04 (version 10.19.0).  We may be able
## to bump this when we bump the base image.
RUN npm install --global configurable-http-proxy@"<4.5.0" \
    && rm -rf ~/.npm

## JupyterHub list very recent version for most dependencies (not sure
## they really require them, my guess is that they just pinned a
## recent version).  The end result is that almost none of them are
## available in the Ubuntu repos so we might as well let pip handle
## installation for all of them.
RUN pip3 install --no-cache-dir \
         jupyterhub \
         notebook

## These are requirements for the practicals themselves.
RUN pip3 install --no-cache-dir \
         matplotlib \
         nbstripout \
         numpy \
         pillow \
         requests \
         torch \
         torchvision


## Instead of copying the whole data for each user, each gets a
## symlink to the data itself.  They need a copy of the notebook
## itself so they can make changes to it though.
COPY "category-recognition-cnn-pytorch" \
     "/srv/practicals/category-recognition-cnn-pytorch/"
COPY "cnn-pytorch" \
     "/srv/practicals/cnn-pytorch/"
COPY "object-category-detection-pytorch" \
     "/srv/practicals/object-category-detection-pytorch/"

RUN for PRACTICAL_NAME in category-recognition-cnn-pytorch \
                          cnn-pytorch \
                          object-category-detection-pytorch ; \
    do \
        mkdir /etc/skel/${PRACTICAL_NAME} ; \
        cp --target-directory /etc/skel/${PRACTICAL_NAME} \
            /srv/practicals/${PRACTICAL_NAME}/lab.py \
            /srv/practicals/${PRACTICAL_NAME}/practical.ipynb ; \
        ln -s /srv/practicals/${PRACTICAL_NAME}/data \
            /etc/skel/${PRACTICAL_NAME}/data ; \
    done


RUN mkdir -p /etc/jupyterhub \
    && echo -n '#!/bin/sh\n\
adduser --quiet --gecos "" --disabled-password  $1\n\
echo "$1:$1" | chpasswd\n\
' > /etc/jupyterhub/add_user.sh \
    && chmod 755 /etc/jupyterhub/add_user.sh \
    && echo -n '\
c.JupyterHub.base_url = "vgg-practicals/"\n\
c.Authenticator.admin_users = {"vgg"}\n\
c.Authenticator.delete_invalid_users = True\n\
c.Authenticator.create_system_users = True\n\
c.LocalAuthenticator.add_user_cmd = ["/etc/jupyterhub/add_user.sh"]\n\
c.JupyterHub.admin_access = True\n\
c.NotebookApp.allow_origin = "*"\n\
c.Spawner.args = ["--NotebookApp.allow_origin=*"]\n\
' > /etc/jupyterhub/jupyterhub_config.py

EXPOSE 8000

WORKDIR /var/lib/jupyterhub
CMD ["jupyterhub", "--config", "/etc/jupyterhub/jupyterhub_config.py"]
