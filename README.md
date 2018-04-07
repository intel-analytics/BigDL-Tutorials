# Deep Learning Tutorials on Apache Spark using BigDL

Step-by-step Deep Learning Tutorials on Apache Spark using [BigDL](https://github.com/intel-analytics/BigDL/). The tutorials are inspired by [Apache Spark examples](http://spark.apache.org/examples.html), the [Theano Tutorials](https://github.com/Newmu/Theano-Tutorials) and the [Tensorflow tutorials](https://github.com/nlintz/TensorFlow-Tutorials).

### Topics
1. RDD [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/spark_basics/RDD.ipynb)]
2. DataFrame [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/spark_basics/DataFrame.ipynb)]
3. SparkSQL [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/spark_basics/spark_sql.ipynb)]
4. StructureStreaming [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/spark_basics/structured_streaming.ipynb)]
5. Forward and backward [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/forward_and_backward.ipynb)]
6. Linear Regression [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/linear_regression.ipynb) | [Scala](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/scala/neural_networks/linear_regression.ipynb)]
7. Introduction to MNIST [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/introduction_to_mnist.ipynb) | [Scala](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/scala/neural_networks/introduction_to_mnist.ipynb)]
8. Logistic Regression [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/logistic_regression.ipynb) | [Scala](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/scala/neural_networks/logistic_regression.ipynb)]
9. Feedforward Neural Network [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/deep_feed_forward_neural_network.ipynb)]
10. Convolutional Neural Network [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/cnn.ipynb)]
11. Recurrent Neural Network [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/rnn.ipynb)]
12. LSTM [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/lstm.ipynb)]
13. Bi-directional RNN [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/birnn.ipynb)]
14. Auto-encoder [[Python](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/python/neural_networks/autoencoder.ipynb)]

### Environment
+ Python 2.7
+ JDK 8
+ Apache Spark 2.2.0
+ Jupyter Notebook 4.1
+ BigDL 0.5.0
+ [Setup env on Mac OS](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupMac.md) / [Setup env on Linux](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupLinux.md)

### Start Jupyter Server
* Run ```pip install BigDL==0.5.0```
* Run ```jupyter notebook --notebook-dir=./ --ip=* --no-browser```

### Start Toree Kernel to Run Scala Notebooks
* Run ```pip install BigDL==0.5.0```
* Run ```pip install https://dist.apache.org/repos/dist/dev/incubator/toree/0.2.0/snapshots/dev1/toree-pip/toree-0.2.0.dev1.tar.gz```
* Run ```./toree_install.sh```
* Run ```jupyter notebook --notebook-dir=./ --ip=* --no-browser```

## Run Demo
* Open a browser - Suggest Chrome or Firefox or Safari
* Access notebook client at address http://localhost:8888, open the example ipynb files and execute.

