from pyspark.streaming import StreamingContext
# Create a local StreamingContext with two working thread and batch interval of 5 seconds
ssc = StreamingContext(sc, 5)

# Create a DStream that will connect to hostname:port, like localhost:9999
lines = ssc.socketTextStream("localhost", 9999)

# Split each line into words
words = lines.flatMap(lambda line: line.split(" "))

# Count each word in each batch
pairs = words.map(lambda word: (word, 1))

wordCounts = pairs.reduceByKey(lambda x, y: x + y)
# Print the first ten elements of each RDD generated in this DStream to the console
wordCounts.pprint()

# Start the computation
ssc.start()

# Wait for the computation to terminate 
ssc.awaitTermination(20)


# TERMINAL: # Running Netcat
$ nc -lk 9999
apache spark
apache hadoop

