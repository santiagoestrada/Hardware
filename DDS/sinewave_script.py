#!/usr/local/bin/python3

# Linux:
# #!/usr/bin/python3
import numpy as np
import matplotlib.pylab as plt

f = open("script_output.txt","w")

totalsample = 128
fullscale   = 512
zero 		= 512
value 		= 0
pi 			= 3.14159
plot		= [None]*128

f.write("case(input)\n")

for x in range(0,127):
	value = np.sin(x*(2*pi/totalsample))*fullscale + zero
	plot[x]=value
	print("sin is ", x, str(value))
	f.write("{} : {} \n".format(x, value))
plt.plot(plot)
plt.show()
f.close()

conv   = open("convertvaluestohex.txt","r")
txtOut = open("out.txt","w")

line_num = 0

for line in conv:
	val1 = line.strip()
	val2 = int(val1)

	txtOut.write("{} : 10'h{}; //{} \n".format(line_num, hex(val2)[2:], val1))
	line_num+=1
	
conv.close()
txtOut.close()
