# VGG Computer Vision Practicals

The Oxford [Visual Geomery Group](http://www.robots.ox.ac.uk/~vgg)
Computer Vision Practicals is a collection of PyTorch-based hands-on
experiences introducing fundamental concepts in image understanding.

This repository includes the [Jupyter Notebooks]https://jupyter.org/)
to run the practicals, either on your own machine, or [Google
Colab](https://colab.research.google.com/) or similar.


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


## The practicals

### Convolutional neural networks

Learn to use convolutional neural networks (CNNs), an important class
of learnable representations applicable to numerous computer vision
problems and are the main method for feature extraction in image
understanding.  This practical explores the basic CNN building blocks
(linear filters and ReLU), back-propagation, learning CNNs to detect
particular image structures as well as typewritten characters (using a
variety of different fonts), and using stochastic gradient descent
with momentum, mini-batches, and data augmentation.

- [data.tar.gz](https://thor.robots.ox.ac.uk/practicals/cnn-pytorch-2018a/data.tar.gz)


### Image classification

Learn how to tell if an image contains an object of a certain class
(e.g. a dog, a mountain, or a person).  The challenge is to be
invariant to irrelevant factors such as viewpoint and illumination as
well as to the differences between objects (no two mountains look
exactly the same).  The practical covers using various deep
convolutional neural networks (CNNs) to extract image features,
learning an SVM classifier for five different object classes
(airplanes, motorbikes, people, horses and cars), assessing its
performance using precision-recall curves, and training a new
classifiers from data collected using Internet images.

- [data.tar.gz](https://thor.robots.ox.ac.uk/practicals/category-recognition-cnn-pytorch-2018a/data.tar.gz)


### Object detection

Learn to detect objects such as pedestrian, cars, traffic signs, in an
image.  The challenge is to not only recognize but also localize
objects in images, as well as to enumerate their occurrences,
regardless changes in location, scale, illumination, articulation, and
many other factors.  The practical covers using HOG features to
describe image regions, building a sliding-window SVM object detector,
operating at multiple scales, evaluating a detector using average
precision, and improving it using hard negative mining.

- [data.tar.gz](https://thor.robots.ox.ac.uk/practicals/object-category-detection-pytorch-2018a/data.tar.gz)


### Approximate Nearest Neighbour (ANN) Methods

Compare exhaustive search to Approximate Nearest Neighbour (ANN)
methods, namely Product Quantization (PQ) and Vector Quantization.

- [data.tar.gz](https://thor.robots.ox.ac.uk/practicals/ann-faiss-2021/data.tar.gz)
