from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np
import time


class plot3d:
    """This class creates and up dates the plot"""
    def __init__(self, matrix:np.array):
        """input: matrix is the 2d array link that whill be shown"""
        plt.ion()
        self._matrix = matrix
        shape  = np.shape(matrix)
        print(shape)
        xarrange = np.arange(0,shape[0])
        yarrange = np.arange(0,shape[1])
        self._grid = np.meshgrid(xarrange,yarrange)
        plt.ion();
        self._fig = plt.figure()
        self._ax = self._fig.add_subplot(111, projection='3d' )
        self._surf= self._ax.plot_surface(self._grid[0], self._grid[1],self._matrix, antialiased=False)
        plt.draw()
        self._fig.canvas.flush_events()

    def update(self, matrix:np.array):
        self._matrix = matrix
        self._surf.remove()
        self._surf= self._ax.plot_surface(self._grid[0], self._grid[1],self._matrix, antialiased=False, color='b')
        plt.draw()
        self._fig.canvas.flush_events()


if __name__ == '__main__':
    A = np.random.normal(0,0.5,(5,5))
    p = plot3d(A)
    for i in np.arange(10):
        A = np.random.normal(0,0.5,(5,5))
        p.update(A)
        time.sleep(0.5)



# fig = plt.figure()
# ax = fig.gca(projection='3d')

# # Make data.
# X = np.arange(0,5)
# Y = np.arange(0,5)
# X, Y = np.meshgrid(X, Y)
# Z = np.random.normal(0,0.5,(5,5))

# # Plot the surface.
# surf = ax.plot_surface(X, Y, Z, cmap=cm.coolwarm,
#                        linewidth=0, antialiased=False)

# # Customize the z axis.
# ax.set_zlim(-1.01, 1.01)
# ax.zaxis.set_major_locator(LinearLocator(10))
# ax.zaxis.set_major_formatter(FormatStrFormatter('%.02f'))

# # Add a color bar which maps values to colors.
# fig.colorbar(surf, shrink=0.5, aspect=5)

# plt.show()

