import numpy as np
from tempfile import mkdtemp
import os.path as path
from time import sleep
import json

"""
File: memmap.py
Author: Magnus Sörensen
Description:    The mymap command handles the communication between client and
                server using an temp file. The path to that temp file is
                created by in data/mymap.json file. To create that file run
                this file as its own instance.
"""


class mymap(object):
    """mymap is an object that handles communication between client server"""
    def __init__(self):
        """ The matrix is is needed to set the size of the data """
        self._confpath = 'data/mymap.json'
        with open(self._confpath, 'r') as cf:
            self._conf = json.load(cf)
        self._file = self._conf['datapath']
        #self._file = path.join(mkdtemp(),filename)

    def write(self, matrix:np.ndarray):
        """ Writes the matrix to the temp file """
        self._conf['shape'] = np.shape(matrix)
        with open(self._confpath, 'w') as cf:
            json.dump(self._conf, cf)
        assert(np.shape(matrix) == self._conf['shape'])
        fp = np.memmap(self._file,dtype='float32', mode='w+', shape=tuple(self._conf['shape']))
        fp[:] = matrix[:]
        del fp

    def read(self, matrix:np.ndarray):
        """ Read the matrix from the temp file """
        with open(self._confpath, 'r') as cf:
            self._conf = json.load(cf)
        print("shape = {}".format(self._conf['shape']))
        fp = np.memmap(self._file,dtype='float32', mode='r', shape=tuple(self._conf['shape']))
        matrix[:] = fp[:]
        del fp

    def get_shape(self):
        return tuple(self._conf['shape'])

if __name__ == '__main__':
    data_shape = (5,6)
    cfile = path.join(mkdtemp(),'data.dat')
    config = {'datapath':cfile, 'shape':data_shape}
    with open(confpath, 'w') as conf_out:
        json.dump(config, conf_out)
    # -- Test if if work ---
    A = np.random.normal(0.0,0.5,data_shape)
    B = np.zeros(data_shape)
    w = mymap()
    w.write(A)
    sleep(1)
    r = mymap()
    r.read(B)
    print(A)
    print(B)
    print(np.testing.assert_almost_equal(A,B))

