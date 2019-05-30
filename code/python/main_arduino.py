from memmap import mymap
import json
import numpy as np
import serial
import time
import pandas as pd

class arduino:
    """description"""
    def __init__(self):
        self.set_serial('/dev/ttyACM1', 9600)
        self._save = mymap()
        # self._sworder = pd.read_csv('data/switchingOrder.csv', name=['from', 'to'], delimiter=';')
        #self._mediansToMatrix = pd.read_csv('data/meansToMatrix.csv',delimiter=';', names=['from', 'to'], dtype=np.int8)
        self._mediansToMatrix = pd.read_csv('data/meansToMatrix.csv',delimiter=';', names=['from', 'to'])
        self._datanp = np.zeros((8, 8))
        self._medmax = max(
                max(self._mediansToMatrix['from']),
                max(self._mediansToMatrix['to'])
                )

    def read_data(self):
        if not self._serial.isOpen():
            self._serial.open()
            time.sleep(0.5)
        print("read serial")
        self._dataraw = str(self._serial.readline())
        print(self._dataraw)
        left = self._dataraw.find('[')
        right = self._dataraw.find(']')
        if (left > 0) and (right > left):
            pruned = self._dataraw[left+1:right]
            try:
                self._datanp = np.array(list(map(lambda x: int(x), pruned.split(','))))
            except Exception as e:
                print(f"Exception: {e}")
                self._datavalid = False
            else:
                self._datavalid = True
                print(self._datanp)
        else:
            self._datavalid = False
        print(f'Found inexd left={left} right={right}, valdi={self._datavalid}')


    def port_data(self):
        # Ine here the data needs to be converted to an MxN pixel array.
        print("port_data")
        if self._datavalid:
            msize = (8,8)
            medmat = np.zeros(msize)
            index = 0
            for row in np.arange(msize[0]):
                for col in np.arange(msize[1]):
                    idx = self._mediansToMatrix.loc[min(index, len(self._mediansToMatrix)-1)]
                    temp = self._datanp
                    stemp = len(temp)-1
                    # print(f'datanp= {temp}')
                    # print(idx)
                    fr = min(int(idx['from']), stemp)
                    to = min(int(idx['to']), stemp)
                    print("from={}, to={}".format(fr, to))
                    s = 1/2 * (temp[fr] + temp[to])
                    print(f'sum is {s}')
                    medmat[row,col]  = s
                    index += 1
            print(medmat)
            self._save.write(medmat)
        else:
            print('No data created')

    def set_serial(self, port, speed):
        self._port = port
        self._speed = speed
        try:
            self._serial = serial.Serial(
                    port=self._port,
                    baudrate=self._speed,
                    parity=serial.PARITY_NONE,
                    stopbits=serial.STOPBITS_ONE,
                    bytesize=serial.EIGHTBITS,
                    timeout=5)
            time.sleep(1)
            self._serial.flush()
            #self._serial.close()
            print("isopen = {}".format(self._serial.isOpen()))
        except Exception as e:
            print(f"Faile: {e}")
            self._serial.close()
            raise e



def main():
    ard = arduino()
    while True:
        ard.read_data()
        ard.port_data()
    pass

if __name__ == '__main__':
    main()
