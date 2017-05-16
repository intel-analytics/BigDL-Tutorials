import pandas
import datetime as dt
from nn.layer import *
from nn.criterion import *
from optim.optimizer import *
from util.common import *
from dataset.transformer import *
from dataset import mnist
from utils import get_mnist
init_engine()

# Get and store MNIST into RDD of Sample, please edit the "mnist_path" accordingly.
mnist_path = "~/Desktop/spark/mnist"

(train_data, test_data) = get_mnist(sc, mnist_path)
print train_data.count()
print test_data.count()
# Parameters
learning_rate = 0.2
training_epochs = 15
batch_size = 2048

# Network Parameters
n_input = 784 # MNIST data input (img shape: 28*28)
n_classes = 10 # MNIST total classes (0-9 digits)
# Define the logistic_regression model
def logistic_regression(n_input, n_classes):

    # Initialize a sequential container
    model = Sequential()
 
    model.add(Reshape([28*28]))
    model.add(Linear(n_input, n_classes))
    model.add(LogSoftMax())
    
    return model
    
model = logistic_regression(n_input, n_classes)
# Create an Optimizer
state = {"learningRate": learning_rate}

optimizer = Optimizer(
    model=model,
    training_rdd=train_data,
    criterion=ClassNLLCriterion(),
    optim_method="SGD",
    state=state,
    end_trigger=MaxEpoch(training_epochs),
    batch_size=batch_size)
# Start to train

trained_model = optimizer.optimize()
print "Optimization Done."
def map_predict_label(l):
    return np.array(l).argmax()
def map_groundtruth_label(l):
    return l[0] - 1
# Prediction
predictions = trained_model.predict(test_data)

imshow(np.column_stack([np.array(s.features).reshape(28,28) for s in test_data.take(8)]),cmap='gray'); axis('off')
print 'Ground Truth labels:'
print ', '.join(str(map_groundtruth_label(s.label)) for s in test_data.take(8))
print 'Predicted labels:'
print ', '.join(str(map_predict_label(s)) for s in predictions.take(8))
