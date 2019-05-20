import pandas as pd
#import numpy as np

data = pd.read_csv('switchingOrder.csv', delimiter=';', names=['Gain','Ground'])
counter = 0

with open('../arduino/src/getdata.c', 'w') as fp:
    fp.write("void getdata(){\n")
    for index, row in data.iterrows():
        fp.write(f'\tdata[{counter}] = read_data({row["Gain"]},{row["Ground"]});\n')
        counter += 1
    fp.write("}\n")

