from __future__ import print_function
from bigdl.dataset import mnist
from bigdl.util.common import *
import numpy as np
from bigdl.nn.keras.topology import Sequential
from bigdl.nn.keras.layer import *
from bigdl.nn.criterion import *
 
 
mnist_path = "datasets/mnist"
(X_train, Y_train), (X_test, Y_test) = mnist.load_data(mnist_path)
X_train=X_train[0:20000]
Y_train=Y_train[0:20000]
 
X_test=X_test[0:2000]
Y_test=Y_test[0:2000]
 
print(X_train.shape)
print(X_test.shape)
print(Y_train.shape)
print(Y_test.shape)
 
num_fc = 512
num_outputs = 10
model = Sequential()
model.add(Reshape((1, 28, 28), input_shape=(28, 28, 1)))
model.add(Convolution2D(20, 3, 3, activation="relu", input_shape=(1, 28, 28)))
model.add(MaxPooling2D())
model.add(Convolution2D(50, 3, 3, activation="relu", name="conv2_5x5"))
model.add(MaxPooling2D())
model.add(Flatten())
model.add(Dense(num_fc, activation="relu", name="fc1"))
model.add(Dense(num_outputs, activation="softmax", name="fc2"))
 
print(model.get_input_shape())
print(model.get_output_shape())
 
model.compile(loss='sparse_categorical_crossentropy',
                  optimizer='adam',
                metrics=['accuracy'])
 
model.fit(X_train, Y_train, batch_size=32, nb_epoch=2,validation_data=(X_test, Y_test))
