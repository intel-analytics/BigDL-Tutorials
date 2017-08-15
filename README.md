# Deep Leaning Tutorials on Apache Spark using BigDL

Step-by-step Deep Leaning Tutorials on Apache Spark using [BigDL](https://github.com/intel-analytics/BigDL/). The tutorials are inspired by [Apache Spark examples](http://spark.apache.org/examples.html), the [Theano Tutorials](https://github.com/Newmu/Theano-Tutorials) and the [Tensorflow tutorials](https://github.com/nlintz/TensorFlow-Tutorials).

### Topics
1. [RDD](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/spark_basics/RDD.ipynb) 
2. [DataFrame](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/spark_basics/DataFrame.ipynb)
3. [SparkSQL](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/spark_basics/spark_sql.ipynb)
4. [StructureStreaming](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/spark_basics/structured_streaming.ipynb)
5. [Forward and backward](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/forward_and_backward.ipynb)
6. [Linear Regression](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/linear_regression.ipynb)
7. [Introduction to MNIST](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/introduction_to_mnist.ipynb)
8. [Logistic Regression](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/logistic_regression.ipynb)
9. [Feedforward Neural Network](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/deep_feed_forward_neural_network.ipynb)
10. [Convolutional Neural Network](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/cnn.ipynb)
11. [Recurrent Neural Network](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/rnn.ipynb)
12. [LSTM](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/lstm.ipynb)
13. [Bi-directional RNN](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/birnn.ipynb)
14. [Auto-encoder](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/notebooks/neural_networks/autoencoder.ipynb)

### Environment
+ Python 2.7
+ JDK 8
+ Apache Spark 2.1.0
+ Jupyter Notebook 4.1
+ BigDL 0.2.0
+ [Setup env on Mac OS](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupMac.md) / [Setup env on Linux](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupLinux.md)

### Start Jupyter Server
* Download BigDL 0.2.0([linux64](https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.1.1-scala-2.11.8-linux64/0.2.0/dist-spark-2.1.1-scala-2.11.8-linux64-0.2.0-dist.zip), [mac](https://oss.sonatype.org/content/groups/public/com/intel/analytics/bigdl/dist-spark-2.1.1-scala-2.11.8-mac/0.2.0/dist-spark-2.1.1-scala-2.11.8-mac-0.2.0-dist.zip)) and unzip file.
* Run ```export BIGDL_HOME=where is your unzipped bigdl folder```
* Run ```export SPARK_HOME=where is your unpacked spark folder```
* Run ```./start_notebook.sh```

## Run Demo
* Open a browser - Suggest Chrome or Firefox or Safari
* Access notebook client at address http://localhost:8888, open the example ipynb files and execute.

