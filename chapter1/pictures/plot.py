import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(1,1000,1000)
ideal  = 1.0/(0.5+0.5/x)
praxis = 1.0/(0.5+x+0.5/x)

plt.plot(np.log(x), np.log(ideal), color='green', marker='o', linestyle='dashed', linewidth=1, markersize=0)
plt.show()
