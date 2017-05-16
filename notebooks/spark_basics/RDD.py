text_file = sc.parallelize(["hello","hello world"])
counts = text_file.flatMap(lambda line: line.split(" ")).map(lambda word: (word, 1)).reduceByKey(lambda a, b: a + b)
for line in counts.collect():
    print line
