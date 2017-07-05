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

+ [Mac OS](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupMac.md) / [Linux](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupLinux.md)
+ Python 2.7 (Required python libraries: numpy, scipy, pandas, scikit-learn, matplotlib. You may want to use [pip](https://pip.pypa.io/en/stable/) to install these packages.)
+ [Apache Spark 2.1.0](http://spark.apache.org/docs/2.1.0/)
+ [Jupyter Notebook 4.1](http://jupyter.org/install.html)
+ BigDL 0.2.0(download [linux64](https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.1.0-scala-2.11.8-linux64/0.2.0/dist-spark-2.1.0-scala-2.11.8-linux64-0.2.0-dist.zip), [mac](https://oss.sonatype.org/content/groups/public/com/intel/analytics/bigdl/dist-spark-2.1.0-scala-2.11.8-mac/0.2.0/dist-spark-2.1.0-scala-2.11.8-mac-0.2.0-dist.zip))

### Start Jupyter Server

* Download BigDL 0.2.0([linux64](https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.1.0-scala-2.11.8-linux64/0.2.0/dist-spark-2.1.0-scala-2.11.8-linux64-0.2.0-dist.zip), [mac](https://oss.sonatype.org/content/groups/public/com/intel/analytics/bigdl/dist-spark-2.1.0-scala-2.11.8-mac/0.2.0/dist-spark-2.1.0-scala-2.11.8-mac-0.2.0-dist.zip)) and unzip file.
* Create start_notebook.sh, copy and paste the contents below. Edit SPARK_HOME as the folder where you download spark. Set BigDL_HOME to the folder where you unzip in last step. 
```bash
#!/bin/bash

#setup pathes
SPARK_HOME= where the downloaded spark
BigDL_HOME= where the downloaded file unzipped

export PYSPARK_DRIVER_PYTHON=${BigDL_HOME}/pyspark/python_package/venv/bin/jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --allow-root --notebook-dir=~/BigDL --ip=* --no-browser"
#export PYSPARK_PYTHON=${BigDL_HOME}/pyspark/python_package/venv/bin/python
export PYSPARK_PYTHON=/usr/bin/python

export VERSION=0.2.0-SNAPSHOT
export PYTHON_API_PATH=${BigDL_HOME}/dist/lib/bigdl-${VERSION}-python-api.zip
export BigDL_JAR_PATH=${BigDL_HOME}/dist/lib/bigdl-${VERSION}-jar-with-dependencies.jar
export PYTHONPATH=${PYTHON_API_PATH}:$PYTHONPATH

${SPARK_HOME}/bin/pyspark \
  --master local[4] \
  --driver-memory 4g \
  --properties-file ${BigDL_HOME}/conf/spark-bigdl.conf \
  --py-files ${PYTHON_API_PATH} \
  --jars  ${BigDL_JAR_PATH} \
  --conf spark.driver.extraClassPath=${BigDL_JAR_PATH} \
  --conf spark.executor.extraClassPath=bigdl-${VERSION}-jar-with-dependencies.jar
```

* Execute start_notebook.sh in bash, it will start a jupyter notebook service and output the url to access
* Go to the url above, you should see the homefolder of jupyter(in the case above, it should be the ~/BigDL directory, which is setted in PYSPARK_DRIVER_PYTHON_OPTS)
* Some times you can only read and write the file in jupyter, but not able to run the code. In this case, you may need putty to open a network tunnel.
## Run Demo
* Open a browser - Suggest Chrome or Firefox or Safari
* Access notebook client at address http://localhost:8888/?token=xxxx (which is in the output of the start_notebook.sh), open the example ipynb files and execute.

