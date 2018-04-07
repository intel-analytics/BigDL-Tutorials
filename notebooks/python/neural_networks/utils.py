import numpy as np
from bigdl.util import common
from bigdl.dataset import mnist

def get_mnist(sc, mnist_path):
    # target is start from 0,
    (train_images, train_labels) = mnist.read_data_sets(mnist_path, "train")
    (test_images, test_labels) = mnist.read_data_sets(mnist_path, "test")
    training_mean = np.mean(train_images)
    training_std = np.std(train_images)
    rdd_train_images = sc.parallelize(train_images)
    rdd_train_labels = sc.parallelize(train_labels)
    rdd_test_images = sc.parallelize(test_images)
    rdd_test_labels = sc.parallelize(test_labels)

    rdd_train_sample = rdd_train_images.zip(rdd_train_labels).map(lambda (features, label):
                                        common.Sample.from_ndarray(
                                        (features - training_mean) / training_std,
                                        label + 1))
    rdd_test_sample = rdd_test_images.zip(rdd_test_labels).map(lambda (features, label):
                                        common.Sample.from_ndarray(
                                        (features - training_mean) / training_std,
                                        label + 1))
    return (rdd_train_sample, rdd_test_sample)
