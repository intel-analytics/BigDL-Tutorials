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
+ Apache Spark 2.2.0
+ Jupyter Notebook 4.1
+ BigDL 0.3.0
+ [Setup env on Mac OS](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupMac.md) / [Setup env on Linux](https://github.com/intel-analytics/BigDL-Tutorials/blob/master/SetupLinux.md)

### Start Jupyter Server
* You can use pip install BigDL, it will install latest official release version
    ```
    pip install BigDL
    ```
    then start Jupyter sever
    ```
    jupyter notebook --notebook-dir=./ --ip=* --no-browser
    ```
* If you want to use different BigDL version, you can download prebuild BigDL binary from https://bigdl-project.github.io/master/#release-download/
    or you can also download source code and build it yourself, more information please refer https://bigdl-project.github.io/master/#ScalaUserGuide/install-build-src/

   Set BIGDL_HOME variable
    ```
    export BIGDL_HOME="Downloaded BigDL located directory"
    ```

   The please prepare Apache Spark enviroment, dowload Spark from http://spark.apache.org/downloads.html

   Set SPARK_HOME variable
    ```
    export SPARK_HOME="Downloaded Spark located directory"
    ```
   Use prepared *start_notebook.sh* to start jupyter server
    ```
    bash start_notebook.sh
    ```

## Run Demo
* Open a browser - Suggest Chrome or Firefox or Safari
* Access notebook client at address http://localhost:8888, open the example ipynb files and execute.