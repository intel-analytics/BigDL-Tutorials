# Data Science on Apache Spark

A step-by-step introduction to data science based on Apache Spark and BigDL framework. This tutorial is inspired by [Apache Spark examples](http://spark.apache.org/examples.html) and [Tensorflow tutorials](https://github.com/nlintz/TensorFlow-Tutorials).

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

+ [Mac OS](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupMac.md) / Linux
+ Python 2.7
+ [Apache Spark 2.1.0](http://spark.apache.org/docs/2.1.0/)
+ [Jupyter Notebook 4.1](http://jupyter.org/install.html)
+ BigDL(download [linux64](https://drive.google.com/file/d/0B7WbKES2D6AxZkEwNVpsMFNVVlU/view?usp=sharing), [mac](https://drive.google.com/file/d/0B7WbKES2D6AxTDJaaUdlRVFRMFU/view?usp=sharing))

### Start Jupyter Server

* Create start_notebook.sh, copy and paste the contents below, and edit SPARK_HOME, BigDL_HOME accordingly.
```bash
#!/bin/bash

#setup pathes
SPARK_HOME= where the downloaded spark
BigDL_HOME= where the downloaded file unzipped

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir=./ --ip=* --no-browser"

```
```
$ source ${BigDL_HOME}/bin/bigdl.sh
$ ${SPARK_HOME}/bin/pyspark \
  --master local[4] \
  --driver-memory 10g \
  --properties-file ${BigDL_HOME}/conf/spark-bigdl.conf \
  --py-files ${BigDL_HOME}/lib/bigdl-0.1.0-python-api.zip \
  --jars ${BigDL_HOME}/lib/bigdl-SPARK_2.1-0.1.0-jar-with-dependencies.jar \
  --conf spark.driver.extraClassPath=${BigDL_HOME}/lib/bigdl-SPARK_2.1-0.1.0-jar-with-dependencies.jar \
  --conf spark.executor.extraClassPath=${BigDL_HOME}/lib/bigdl-SPARK_2.1-0.1.0-jar-with-dependencies.jar
```

* Put start_notebook.sh in home directory and execute it in bash.
    * the root directory in your notebook view is the directory where you execute the script start_notebook.
## Run Demo
* Open a browser - Suggest Chrome or Firefox or Safari
* Access notebook client at address http://localhost:8888, open the example ipynb files and execute.

