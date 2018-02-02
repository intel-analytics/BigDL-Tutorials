# Deep Leaning Tutorials on Apache Spark using BigDL

Step-by-step Deep Leaning Tutorials on Apache Spark using [BigDL](https://github.com/intel-analytics/BigDL/). The tutorials are inspired by [Apache Spark examples](http://spark.apache.org/examples.html), the [Theano Tutorials](https://github.com/Newmu/Theano-Tutorials) and the [Tensorflow tutorials](https://github.com/nlintz/TensorFlow-Tutorials).

- Preface
  - prologgue
  - Organization of the tutorials
  - advices and prerequisites for learners
 
 - Introduction to Spark basics(topic 1-4)
   - introduction to What Spark is, current usage and application(provided by useful links from Spark official site)
   - environment setting and install instructions
   - RDD
   - DataFrame
   - SparkSAL
   - Structured Streaming
 
 - Supervised Learning with BigDL(topic 6-8)
   - install dependencies and set up the envrionment(imports)
   - Introduction to Supervised Learning
     - Linear Regression with BigDL(topic 6)
       - About batch training
       - Data Generation
       - Hyperperameter setup
       - model creation with Linear layer
       - Loss function
       - Optimizer
       - Execute Training
       - Prediction on training data
       - Model evaluation on random test data
     
     - Binary classification with logistic regression
       - similar to structure in "Linear Regression with BigDL" but we bring the introduction to 
         "BigDL's train_summary and validation summary API" and "how to use them to visualize the learing curve" here
     
     - Multiclass classification with logistic regression(topic 8)
       - introduction to MNIST dataset (topic 7)
       - rest is same to the structure in "Linear Regression with BigDL"
     
     - Overfitting and Regularization with BigDL
       - What is overfitting with example
       - Use regulariztion to solve overfitting
       - regularization in BigDL
  
  
 - Nerual Networks with BigDL
   - Introduction to neural networks
   - install dependencies and imports
   - mechanics of weight and gradient update
     - Forward and backward(topic 5)
   - Feedforward Neural Network(topic 9)
   - RNN(topic 11)
   - Bi-RNN(topic 13)
   - LSTM(topic 12)
   - CNN(topic 10 will include "batch normalization" here)
     - batch normalization
   - Auto-encoder(topic 14)
       
    *These neural network topics will have the same structure in "Binary classification with logistic regression"*
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


