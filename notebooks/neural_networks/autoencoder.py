import numpy as np
import datetime as dt
import matplotlib.pyplot as plt
from nn.layer import *
from nn.criterion import *
from optim.optimizer import *
from util.common import *
from dataset.transformer import *
from dataset import mnist
from utils import get_mnist
init_engine()

# Get and store MNIST into RDD of Sample, please edit the "mnist_path" accordingly.
mnist_path = "datasets/mnist"

(train_data, test_data) = get_mnist(sc, mnist_path)
train_data = train_data.map(lambda sample:
            Sample.from_ndarray(np.resize(sample.features, (28*28,)), np.resize(sample.features, (28*28,))))
test_data = test_data.map(lambda sample:
            Sample.from_ndarray(np.resize(sample.features, (28*28,)), np.resize(sample.features, (28*28,))))
print train_data.count()
print test_data.count()

# Parameters
learning_rate = 0.001

training_epochs = 10
batch_size = 128
display_step = 1
examples_to_show = 10

# Network Parameters
n_hidden = 32
n_input = 784 # MNIST data input (img shape: 28*28)

def build_autoencoder(n_input, n_hidden):
    # Initialize a sequential container
    model = Sequential()
    # encoder
    model.add(Linear(n_input, n_hidden))
    model.add(ReLU())
    model.add(Linear(n_hidden, n_input))
    model.add(Sigmoid())
    
    return model

model = build_autoencoder(n_input, n_hidden)

# Create an Optimizer
state = {"learningRate": 0.01, "weightDecay": 0.0, "momentum": 0.9, "dampening": 0.0}

optimizer = Optimizer(
    model=model,
    training_rdd=train_data,
    criterion=MSECriterion(),
    optim_method="Adagrad",
    state=state,
    end_trigger=MaxEpoch(2),
    batch_size=batch_size)

app_name='autoencoder-'+dt.datetime.now().strftime("%Y%m%d-%H%M%S")
train_summary = TrainSummary(log_dir='/tmp/bigdl_summaries',
                                     app_name=app_name)
optimizer.set_train_summary(train_summary)

print "saving logs to ",app_name

# Boot training process
trained_model = optimizer.optimize()
print "Optimization Done."

loss = np.array(train_summary.read_scalar("Loss"))
lr = np.array(train_summary.read_scalar("LearningRate"))

plt.figure(figsize = (12,12))
plt.plot(loss[:,0],loss[:,1],label='loss')
plt.xlim(0,loss.shape[0]+10)
plt.grid(True)
plt.title("loss")
(images, labels) = mnist.read_data_sets(mnist_path, "test")
examples = trained_model.predict(test_data).take(10)
f, a = plt.subplots(2, 10, figsize=(10, 2))
for i in range(examples_to_show):
    a[0][i].imshow(np.reshape(images[i], (28, 28)))
    a[1][i].imshow(np.reshape(examples[i], (28, 28)))
