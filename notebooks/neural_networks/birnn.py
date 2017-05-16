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
mnist_path = "datasets/mnist"

(train_data, test_data) = get_mnist(sc, mnist_path)
train_data = train_data.map(lambda s: Sample.from_ndarray(np.resize(s.features, (28, 28)), s.label))
test_data = test_data.map(lambda s: Sample.from_ndarray(np.resize(s.features, (28, 28)), s.label))
print train_data.count()
print test_data.count()

# Parameters
learning_rate = 0.001
training_iters = 100000
batch_size = 64
display_step = 10

# Network Parameters
n_input = 28 # MNIST data input (img shape: 28*28)
n_steps = 28 # timesteps
n_hidden = 128 # hidden layer num of features
n_classes = 10 # MNIST total classes (0-9 digits)

def build_model(input_size, n_hidden, output_size):
    model = Sequential()
    recurrent = BiRecurrent(JoinTable(3, 3))
    recurrent.add(LSTM(input_size, n_hidden))
    model.add(InferReshape([-1, n_input], True))
    model.add(recurrent)
    model.add(Select(2, 28))
    model.add(Linear(2*n_hidden, output_size))
    return model

rnn_model = build_model(n_input, n_hidden, n_classes)

criterion = CrossEntropyCriterion()
state = {"learningRate": learning_rate}

optimizer = Optimizer(
    model=rnn_model,
    training_rdd=train_data,
    criterion=criterion,
    optim_method="adam",
    state=state,
    end_trigger=MaxEpoch(5),
    batch_size=batch_size)
# Set the validation logic
optimizer.set_validation(

    batch_size=batch_size,
    val_rdd=test_data,
    trigger=EveryEpoch(),
    val_method=["Top1Accuracy"]
)

app_name='rnn-'+dt.datetime.now().strftime("%Y%m%d-%H%M%S")
train_summary = TrainSummary(log_dir='/tmp/bigdl_summaries',
                                     app_name=app_name)
train_summary.set_summary_trigger("Parameters", SeveralIteration(50))
val_summary = ValidationSummary(log_dir='/tmp/bigdl_summaries',
                                        app_name=app_name)
optimizer.set_train_summary(train_summary)
optimizer.set_val_summary(val_summary)
print "saving logs to ",app_name

# Boot training process
trained_model = optimizer.optimize()
print "Optimization Done."

def map_predict_label(l):
    return np.array(l).argmax()

def map_groundtruth_label(l):
    return l[0] - 1

predictions = trained_model.predict(test_data)
imshow(np.column_stack([np.array(s.features).reshape(28,28) for s in test_data.take(8)]),cmap='gray'); axis('off')
print 'Ground Truth labels:'
print ', '.join(str(map_groundtruth_label(s.label)) for s in test_data.take(8))
print 'Predicted labels:'
print ', '.join(str(map_predict_label(s)) for s in predictions.take(8))
    
loss = np.array(train_summary.read_scalar("Loss"))
top1 = np.array(val_summary.read_scalar("Top1Accuracy"))
plt.figure(figsize = (12,12))
plt.subplot(2,1,1)
plt.plot(loss[:,0],loss[:,1],label='loss')
plt.xlim(0,loss.shape[0]+10)
plt.grid(True)
plt.title("loss")
plt.subplot(2,1,2)
plt.plot(top1[:,0],top1[:,1],label='top1')
plt.xlim(0,loss.shape[0]+10)
plt.title("top1 accuracy")
plt.grid(True)
