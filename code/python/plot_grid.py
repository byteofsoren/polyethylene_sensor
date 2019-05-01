import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.preprocessing import PolynomialFeatures


def read_data(path:str):
    data = pd.read_csv(path)
    return data

def getpolly(x,y, degre:int):
    ftemp = np.polyfit(x,y,degre)
    poly = np.poly1d(ftemp)
    return poly

def plot_poly(poly, start, stop,num):
    xp = np.linspace(start,stop,num)
    plt.plot(xp,list(map(poly, xp)))

if __name__ == '__main__':
    data = read_data('gridcalc.csv')
    poi = str(input("Plot or input [Plot/in]")).lower()
    x = data['points (n)'].values
    y = data['Vertex (M)'].values
    poly = getpolly(x,y,1)
    if (len(poi) == 0) or (poi == 'p'):
        plt.scatter(x,y)
        plot_poly(poly,1,26,1000)
        plt.show()
    else:
        print("Insert grid params:")
        w = int(input("Width ="))
        h = int(input("Hight ="))
        print("Nr of mesurments is {}st".format(poly(w+h)))

