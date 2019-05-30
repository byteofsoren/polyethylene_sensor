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
        self._save = mymap()
        # self._sworder = pd.read_csv('data/switchingOrder.csv', name=['from', 'to'], delimiter=';')
        #self._mediansToMatrix = pd.read_csv('data/meansToMatrix.csv',delimiter=';', names=['from', 'to'], dtype=np.int8)
        self._mediansToMatrix = pd.read_csv('data/meansToMatrix.csv',delimiter=';', names=['from', 'to'])
        self._datanp = np.zeros((8, 8))
        self.use_serial = False
        self._medmax = max(
                max(self._mediansToMatrix['from']),
                max(self._mediansToMatrix['to'])
                )

    def read_data(self):
        if not self._serial.isOpen():
            self._serial.open()
            time.sleep(0.5)
        print("read serial")
        # 3434534 [239,234,342,234]....
        # If you want to read the data from the arduino then set use_serial=True
        if self.use_serial:
            self._dataraw = str(self._serial.readline())
        else:
            #self._dataraw = '[123,123,43,123,321,322]'
            # self._dataraw = "[{}]".format(','.join([str(x) for x in d]))
            #
            """
            Reading the data list array to a string.
            Then reformat the data into a format that the code
            expects. The first variable below is a hack to solve that
             ',' apears in the wrong place redering the data invalid.
            """
            with open('data/testArray.csv', 'r') as fp:
                self._dataraw = "233,344,[{}]3454".format(fp.read().replace('\n',''))

        print(self._dataraw)
        left = self._dataraw.find('[')
        right = self._dataraw.find(']')
        if (left > 0) and (right > left):
            # 239,234,342,234
            pruned = self._dataraw[left+1:right]
            try:
                # 239.ee,234,342,234
                # self._datanp = np.array(list(map(lambda x: int(x), pruned.split(','))))
                self._datanp = np.array(list(map(lambda x: float(x), pruned.split(','))))
                # np.array([239,234,342,234])
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
    ard.use_serial = False
    while True:
        ard.read_data()
        ard.port_data()
    pass

if __name__ == '__main__':
    main()
