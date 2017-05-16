from nn.layer import *
from nn.criterion import *
import numpy as np

# the input data size is 2*1, the output size is 1*1
linear = Linear(2, 1)
# print the randomly initialized parameters
print linear.parameters()

input = np.array([1,-2])
# forward to output
output = linear.forward(input)
print output

# mean absolute error
mae = AbsCriterion()
target = np.array([0])

loss = mae.forward(output, target)
print("loss: " + str(loss))
        
grad_output = mae.backward(output, target)
linear.backward(input, grad_output)

print linear.parameters()