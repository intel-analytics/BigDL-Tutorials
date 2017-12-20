#!/bin/bash

export NOTEBOOK_DIR="../../notebooks"
export PORT=12345

jupyter notebook --notebook-dir=${NOTEBOOK_DIR} --ip=* --port=${PORT} --no-browser --allow-root --NotebookApp.token=''
