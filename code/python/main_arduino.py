from memmap import mymap
import json
import numpy as np
from time import sleep
import serial
import pandas as pd


virtual_serial = True

class arduino(object):
    """docstring for arduino"""
    def __init__(self, connection:str):
        self._connection = connection
        self._memory = mymap()
        self._confpath = 'data/mymap.json'
        # Read the data and store in in _conf
        with open(self._confpath, 'r') as cf:
            self._conf = json.load(cf)

        if not virtual_serial:
            self._serial = serial.Serial(connection, 115200)
        # Load the matrix build
        self._load:pd.DataFrame = pd.read_csv('data/meansToMatrix.csv', names=['a','b'], delimiter=';')
        # for i, row in self._load.iterrows():
        #     pass
        #     print("{a} connect to {b}.".format(a=row['a'],b=row['b']))


    def read_data(self):
        """
        Description: Reads the data from the Arduino
        """
        if virtual_serial:
            shape = (5,5)
            self._data = np.random.normal(0,0.5,shape)
        else:
            while (self._serial.inWaiting() == 0):
                pass
            text:str = self._serial.readline()
            if (text[0] == '[') and (text[-1] == ']'):
                text = text.replace('[', '')
                text = text.replace(']', '')
                indata = list(map(float, text.split(',')))
                for index,row in self._load.iterrows():
                    pass
                    # Construct the data array.
            else:
                print("Incorrect data skipping this one")
        pass

    def write_data(self):
        """
        Description: Writes the data to the shared memmory.
        """
        self._memory.write(self._data)
        pass

def main():
    while True:
        print("mani_arduino")
        ard = arduino('/dev/ttyUSB0')
        ard.read_data()
        ard.write_data()
        sleep(np.random.random())
    pass

if __name__ == '__main__':
    main()
