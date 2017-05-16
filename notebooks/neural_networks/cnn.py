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

# * prepare train and validation samples
#
# Get and store MNIST into RDD of Sample, please edit the "mnist_path" accordingly.
mnist_path = "datasets/mnist"

(train_data, test_data) = get_mnist(sc, mnist_path)
print train_data.count()
print test_data.count()
# Create a LeNet model

def build_model(class_num):

    model = Sequential()
    model.add(Reshape([1, 28, 28]))
    model.add(SpatialConvolution(1, 6, 5, 5).set_name('conv1'))
    model.add(Tanh())
    model.add(SpatialMaxPooling(2, 2, 2, 2).set_name('pool1'))
    model.add(Tanh())
    model.add(SpatialConvolution(6, 12, 5, 5).set_name('conv2'))
    model.add(SpatialMaxPooling(2, 2, 2, 2).set_name('pool2'))
    model.add(Reshape([12 * 4 * 4]))
    model.add(Linear(12 * 4 * 4, 100).set_name('fc1'))
    model.add(Tanh())
    model.add(Linear(100, class_num).set_name('score'))
    model.add(LogSoftMax())
    return model

lenet_model = build_model(10)
# Create an Optimizer
state = {"learningRate": 0.4,
         "learningRateDecay": 0.0002}

optimizer = Optimizer(
    model=lenet_model,
    training_rdd=train_data,
    criterion=ClassNLLCriterion(),
    optim_method="SGD",
    state=state,
    end_trigger=MaxEpoch(20),
    batch_size=2048)
# Set the validation logic
optimizer.set_validation(

    batch_size=2048,
    val_rdd=test_data,
    trigger=EveryEpoch(),
    val_method=["Top1Accuracy"]
)

app_name='lenet-'+dt.datetime.now().strftime("%Y%m%d-%H%M%S")
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

# label-1 to restore the original label.
print "Ground Truth labels:"
print ', '.join([str(map_groundtruth_label(s.label)) for s in train_data.take(8)])
imshow(np.column_stack([np.array(s.features).reshape(28,28) for s in train_data.take(8)]),cmap='gray'); axis('off')

predictions = trained_model.predict(test_data)
imshow(np.column_stack([np.array(s.features).reshape(28,28) for s in test_data.take(8)]),cmap='gray'); axis('off')
print 'Ground Truth labels:'
print ', '.join(str(map_groundtruth_label(s.label)) for s in test_data.take(8))
#print 'Ground Truth:'
#print '\t'.join([str(s.label) for s in ground_truth])
print 'Predicted labels:'
print ', '.join(str(map_predict_label(s)) for s in predictions.take(8))# Now look at the parameter shapes. The parameters are exposed as a dict, and can be retrieved using model.parameters().
#
params = trained_model.parameters()
#batch num, output_dim, input_dim, spacial_dim
for layer_name, param in params.iteritems():

    print layer_name,param['weight'].shape,param['bias'].shape
#vis_square is borrowed from caffe example
def vis_square(data):

    """Take an array of shape (n, height, width) or (n, height, width, 3)
       and visualize each (height, width) thing in a grid of size approx. sqrt(n) by sqrt(n)"""
    
    # normalize data for display
    data = (data - data.min()) / (data.max() - data.min())
    # force the number of filters to be square
    n = int(np.ceil(np.sqrt(data.shape[0])))
    padding = (((0, n ** 2 - data.shape[0]),
               (0, 1), (0, 1))                 # add some space between filters
               + ((0, 0),) * (data.ndim - 3))  # don't pad the last dimension (if there is one)
    data = np.pad(data, padding, mode='constant', constant_values=1)  # pad with ones (white)
    
    # tile the filters into an image
    data = data.reshape((n, n) + data.shape[1:]).transpose((0, 2, 1, 3) + tuple(range(4, data.ndim + 1)))
    data = data.reshape((n * data.shape[1], n * data.shape[3]) + data.shape[4:])
  
    plt.imshow(data,cmap='gray'); plt.axis('off')
    
filters_conv1 = params['conv1']['weight']
filters_conv1[0,0,0]
vis_square(np.squeeze(filters_conv1, axis=(0,)).reshape(1*6,5,5))
# the parameters are a list of [weights, biases]
filters_conv2 = params['conv2']['weight']

vis_square(np.squeeze(filters_conv2, axis=(0,)).reshape(12*6,5,5))
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
