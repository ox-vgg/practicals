# VGG Computer Vision Practicals

The Oxford [Visual Geomery Group](http://www.robots.ox.ac.uk/~vgg)
Computer Vision Practicals is a collection of PyTorch-based hands-on
experiences introducing fundamental concepts in computer vision.

This repository includes the [Jupyter Notebooks](https://jupyter.org/)
to run the practicals, either on your own machine, [Google
Colab](https://colab.research.google.com/), or similar.


## The practicals

Each directory is a stand-alone practical session.  See their own
`README` files for details.

1. [**Image Classification and Retrieval**](./category-recognition-cnn-pytorch)
   [![Open In
   Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ox-vgg/practicals/blob/main/category-recognition-cnn-pytorch/practical.ipynb)

   Learn how to tell if an image contains an object of a certain class
   (e.g. a dog, a mountain, or a person).  The challenge is to be
   invariant to irrelevant factors such as viewpoint and illumination
   as well as to the differences between objects (no two mountains
   look exactly the same).

2. [**Vision Transformers**](./vision-transformers)
   [![Open In
   Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ox-vgg/practicals/blob/main/category-recognition-cnn-pytorch/practical.ipynb)

   This practical introduces Vision Transformers (ViTs) and explores
   their role in modern computer vision.

3. [**Approximate Nearest Neighbour (ANN) Methods**](./ann-faiss)
   [![Open In
   Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ox-vgg/practicals/blob/main/category-recognition-cnn-pytorch/practical.ipynb)

   This short practical focuses on different Approximate Nearest
   Neighbour (ANN) methods, which are used for search and retrieval
   systems that handle high-dimensional data such as images and sound.

4. [**Object Tracking**](./object-tracking)
   [![Open In
   Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ox-vgg/practicals/blob/main/object-tracking/practical.ipynb)

   This practical introduces object tracking as the problem of
   maintaining object identity over time as objects and cameras move,
   a core capability in many real-world vision systems such as
   autonomous driving, robotics, video surveillance, and
   human-computer interaction.  Tracking requires detecting objects in
   each frame and associating them across time while they undergo
   motion, interact with other objects, enter or leave the field of
   view, and experience temporary occlusion.


### Older Practicals

These practicals are no longer maintained but remain interesting.
They explore influential approaches to computer vision and although
many have been superseded they remain valuable for understanding the
evolution of the field and the principles behind modern computer
vision systems.

- [**Convolutional Neural Networks (CNN)**](./cnn-pytorch)
   [![Open In
   Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ox-vgg/practicals/blob/main/cnn-pytorch/practical.ipynb)

  Learn to use convolutional neural networks (CNNs), an important
  class of learnable representations applicable to numerous computer
  vision problems and are the main method for feature extraction in
  image understanding.

- [**Object Detection**](./object-category-detection-pytorch)
   [![Open In
   Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ox-vgg/practicals/blob/main/object-category-detection-pytorch/practical.ipynb)

  Learn to detect objects such as pedestrian, cars, traffic signs, in
  an image.  The challenge is to not only recognize but also localize
  objects in images, as well as to enumerate their occurrences,
  regardless changes in location, scale, illumination, articulation,
  and many other factors.


## Running locally

The practicals are Jupyter Notebooks and therefore you will need to
[install Jupyter](https://jupyter.org/install).

In addition, to run these practicals, you need to download the data
files separately and extract them.  Like so:

    wget --output-document cnn-pytorch/data.tar.gz \
        https://thor.robots.ox.ac.uk/practicals/cnn-pytorch-2018a/data.tar.gz
    wget --output-document category-recognition-cnn-pytorch/data.tar.gz \
        https://thor.robots.ox.ac.uk/practicals/category-recognition-cnn-pytorch-2018a/data.tar.gz
    wget --output-document ann-faiss/data.tar.gz \
        https://thor.robots.ox.ac.uk/practicals/ann-faiss-2021/data.tar.gz
    wget --output-document object-category-detection-pytorch/data.tar.gz \
        https://thor.robots.ox.ac.uk/practicals/object-category-detection-pytorch-2018a/data.tar.gz
    md5sum --check << END_CHECKSUMS
    b23d1b3b2ee8469d819b61ca900ef0ed  ann-faiss/data.tar.gz
    258678bbc6f0866f07325d1de965fe7f  category-recognition-cnn-pytorch/data.tar.gz
    dcdafa436450f136052d418377c7171f  cnn-pytorch/data.tar.gz
    029cbcef119006ab90e48c72147e163d  object-category-detection-pytorch/data.tar.gz
    END_CHECKSUMS
    tar --extract --gzip \
        --directory ann-faiss \
        --file ann-faiss/data.tar.gz
    tar --extract --gzip \
        --directory category-recognition-cnn-pytorch \
        --file category-recognition-cnn-pytorch/data.tar.gz
    tar --extract --gzip \
        --directory cnn-pytorch \
        --file cnn-pytorch/data.tar.gz
    tar --extract --gzip \
        --directory object-category-detection-pytorch \
        --file object-category-detection-pytorch/data.tar.gz


## Running on Google Colab

To run these practicals on Colab you need a bunch of data files and a
`lab` Python module.  Because Colab only loads the Notebook itself,
these other files need to be downloaded separately.  In addition, each
time the runtime restarts, everything starts fresh and those files
need to be downloaded again.

The first code block on each practical downloads and extract the
required files but those lines are commented.  Uncomment them if
running the practical on Colab.


## Setting up JupyterHub (with docker)

At VGG we setup these on a [JupyterHub](https://jupyter.org/hub)
instance in a docker container running in our own servers for our
students.  The `Dockerfile` in this repository can be used to recreate
the same setup elsewhere.
