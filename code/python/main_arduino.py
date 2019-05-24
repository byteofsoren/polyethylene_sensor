from memmap import mymap
import json
import numpy as np
import serial
import time
import pandas as pd

class arduino:
    """description"""
    def __init__(self):
        self.set_serial('/dev/ttyACM0', 9600)
        self._serial.flush()
        self._save = mymap()
        # self._sworder = pd.read_csv('data/switchingOrder.csv', name=['from', 'to'], delimiter=';')
        self._meatomat = pd.read_csv('data/meansToMatrix.csv',delimiter=';', names=['from', 'to'])

    def read_data(self):
        self._dataraw = str(self._serial.readline())
        if (self._dataraw[2] == '[') and (self._dataraw[-6] == ']'):
            pruned = self._dataraw[3:-6]
            self._datanp = np.array(list(map(int, pruned.split(','))))
        else:
            print("Baad data")

    def port_data(self):
        # Ine here the data needs to be converted to an MxN pixel array.
        msize = (8,8)
        medmat = np.zeros(msize)
        index = 0
        for row in np.arange(msize[0]):
            for col in np.arange(msize[1]):
                idx = self._meatomat.iloc(index)
                medmat[row,col] = 1/2 * (self._datanp[int(idx['from'])] + self._datanp[int(idx['to'])])
                index += 1

        print(medmat)
        #self._save.write()

    def set_serial(self, port, speed):
        self._port = port
        self._speed = speed
        try:
            self._serial = serial.Serial(self._port, self._speed)
        except Exception as e:
            print(f"Faile: {e}")
            raise e



def main():
    ard = arduino()
    while True:
        ard.read_data()
        ard.port_data()
    pass

if __name__ == '__main__':
    main()
