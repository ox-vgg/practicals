# VGG Computer Vision Practicals

The Oxford [Visual Geomery Group](http://www.robots.ox.ac.uk/~vgg)
Computer Vision Practicals is a collection of PyTorch-based hands-on
experiences introducing fundamental concepts in image understanding.

This repository includes the [Jupyter Notebooks]https://jupyter.org/)
to run the practicals, either on your own machine, or [Google
Colab](https://colab.research.google.com/) or similar.


## The practicals

Each directory is a stand-alone practical session.  See their own
`README` files for the details of each of them.


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
