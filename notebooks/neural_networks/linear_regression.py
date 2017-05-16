import pandas
import datetime as dt
from nn.layer import *
from nn.criterion import *
from optim.optimizer import *
from util.common import *
from util.common import Sample
from dataset.transformer import *
import unittest
init_engine()

FEATURES_DIM = 2
data_len = 100
def gen_rand_sample():
    features = np.random.uniform(0, 1, (FEATURES_DIM))
    label = (2 * features).sum() + 0.4
    return Sample.from_ndarray(features, label)

rdd_train = sc.parallelize(range(0, data_len)).map( lambda i: gen_rand_sample() )

# Parameters
learning_rate = 0.2
training_epochs = 5
batch_size = 5
n_input = FEATURES_DIM
n_output = 1 

def linear_regression(n_input, n_output):
    # Initialize a sequential container
    model = Sequential()  
    # Add a linear layer
    model.add(Linear(n_input, n_output))
 
    return model

model = linear_regression(n_input, n_output)
# Create an Optimizer
state = {"learningRate": learning_rate}

optimizer = Optimizer(
    model=model,
    training_rdd=rdd_train,
    criterion=MSECriterion(),
    optim_method="SGD",
    state=state,
    end_trigger=MaxEpoch(training_epochs),
    batch_size=batch_size)
# Start to train
trained_model = optimizer.optimize()

# Print the first five predicted results of training data.
predict_result = trained_model.predict(rdd_train)

p = predict_result.take(5)
print("predict predict: \n")

for i in p:
    print(str(i) + "\n")
    
def test_predict(trained_model):
    np.random.seed(100)
    total_length = 10
    features = np.random.uniform(0, 1, (total_length, 2))
    label = (features).sum() + 0.4
    predict_data = sc.parallelize(range(0, total_length)).map(
        lambda i: Sample.from_ndarray(features[i], label))
    
    predict_result = trained_model.predict(predict_data)
    p = predict_result.take(6)
    ground_label = np.array([[-0.47596836], [-0.37598032], [-0.00492062],
                                 [-0.5906958], [-0.12307882], [-0.77907401]], dtype="float32")
    mse = ((p - ground_label) ** 2).mean()
    print mse
    
test_predict(trained_model)
