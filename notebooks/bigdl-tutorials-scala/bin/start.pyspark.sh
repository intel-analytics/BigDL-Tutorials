#!/bin/bash
export JAVA_HOME=/opt/jdk
export PYSPARK_DRIVER_PYTHON=jupyter
export NOTEBOOK_DIR="../../notebooks"
export PORT=12345
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir=${NOTEBOOK_DIR} --ip=* --port=${PORT} --no-browser --allow-root --NotebookApp.token=''"

/opt/work/spark-2.1.0-bin-hadoop2.7/bin/pyspark --master spark://Gondolin-Node-021:7077 --driver-memory 4g --executor-memory 200G #--num-executors 100
