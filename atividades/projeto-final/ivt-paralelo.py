import math
import time
from pyspark import SparkContext
from pyspark import SparkConf
from operator import add
sc = SparkContext() 
def euclideanDistance(baseTuple):
    coordinateA = baseTuple[0]
    coordinateB = baseTuple[1]

    return (math.sqrt(math.pow((coordinateB[1] - coordinateA[1]), 2) +
        math.pow((coordinateB[2] - coordinateA[2]), 2)))

def parallelizedVelocityThreshold(dataset, threshold):
    firstSetRDD = sc.parallelize(dataset[:-1])
    secondSetRDD = sc.parallelize(dataset[1:])
    zippedRDD = firstSetRDD.zip(secondSetRDD)
    mappedVelocities = zippedRDD.map(lambda x: (x[0],(euclideanDistance(x) / abs(x[0][0] - x[1][0]))))
    
    classifiedVelocities =  (mappedVelocities
                                .map(lambda x: (x[0], "Saccade" if x[1] > threshold else "Fixation"))
                                .sortBy(lambda x: x[0][0])
                                .collect())

    count = -1
    colapsedFixations = []
    saccadeHappened = False

    for elem in classifiedVelocities:
        if elem[1] == "Saccade":
            saccadeHappened = True
        else:
            if len(colapsedFixations) == 0 or saccadeHappened:
                count += 1
                saccadeHappened = False
            print elem
            colapsedFixations.append((count,elem[0]))
    
    colapsedRDD = sc.parallelize(colapsedFixations, 4)
    countRDD = sc.parallelize(colapsedFixations, 4).map(lambda x: (x[0], 1)).reduceByKey(add)

    sumCentroids = colapsedRDD.reduceByKey(lambda (tsa, xa, ya),(tsb, xb, yb): ((tsa+tsb, xa+xb, ya+yb)))
    zippedCentroids = sumCentroids.join(countRDD)
    centroids = zippedCentroids.map(lambda (k,v): (k, v[0][0]/v[1], v[0][1]/v[1], v[0][2]/v[1] ))
    return centroids.collect()

print parallelizedVelocityThreshold([
    (1512264894, 30, 27),
    (1512264904, 35, 27),
    (1512264914, 39, 30),
    (1512264924, 30, 31),
    (1512264934, 40, 35),
    (1512264944, 300, 27),
    (1512264954, 315, 27),
    (1512264964, 320, 27),
    (1512264974, 317, 27)
], 10)