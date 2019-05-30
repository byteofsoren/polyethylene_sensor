from memmap import mymap
from show3d import plot3d
import numpy as np
import json

def main():
    d = mymap()
    #data = np.zeros((5,4))
    data = np.zeros(d.get_shape())
    d.read(data)
    print(data)
    p = plot3d(data)
    while True:
        d.read(data)
        p.update(data)


if __name__ == '__main__':
    main()
