from memmap import mymap
from show3d import plot3d
import numpy as np
import json
import time

def main(dummy:bool=False):
    if not dummy:
        d = mymap()
        #data = np.zeros((5,4))
        data = np.zeros(d.get_shape())
        d.read(data)
        print(data)
        p = plot3d(data)
        while True:
            d.read(data)
            p.update(data)
            time.sleep(0.2)
    else:
        data = np.genfromtxt('data/matrix_defender.csv', delimiter=',')
        p = plot3d(data)
        while True:
            p.update(data)
            time.sleep(0.5)


if __name__ == '__main__':
    main(True)
