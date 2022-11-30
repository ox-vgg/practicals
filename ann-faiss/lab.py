import os
import os.path

import faiss
import numpy as np


def read_fvecs(fp):
    """Read the fvecs file format of Sift1M dataset."""
    a = np.fromfile(fp, dtype='int32')
    d = a[0]
    return a.reshape(-1, d + 1)[:, 1:].copy().view('float32')


def get_memory(index, inMB=True):
    """compute memory usage."""
    faiss.write_index(index, './temp.index')
    filesize = os.path.getsize('./temp.index')
    os.remove('./temp.index')
    if inMB:
        return filesize / (1024*1024)
    else:
        return filesize


def compareRecall(gt, pred):
  tp = 0
  for c, i in enumerate(gt):
      tp += int(i[0] in pred[c])
  recall = tp / gt.shape[0]
  return recall
