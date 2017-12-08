import math
import time
from operator import add

def euclideanDistance(coordinateA, coordinateB):
    return (math.sqrt(math.pow((coordinateB[1] - coordinateA[1]), 2) +
        math.pow((coordinateB[2] - coordinateA[2]), 2)))

def iterativeVelocityThreshold(dataset, threshold):
    mappedVelocities = []
    for index, point in enumerate(dataset):
        if index < (len(dataset) - 1):
            nextPoint = dataset[index+1]
            mappedVelocities.append((point, euclideanDistance(nextPoint, point) / abs(point[0] - nextPoint[0])))

    classifiedVelocities = []
    for index, point in enumerate(mappedVelocities):
        label = "Saccade" if point[1] > threshold else "Fixation"
        classifiedVelocities.append((point, label))

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
                colapsedFixations.append([])
                colapsedFixations[count] = []
            colapsedFixations[count].append(elem[0])

    fixations = []
    for group in colapsedFixations:
        centroid = [0, 0, 0]
        for point in group: 
            centroid[0] = centroid[0] + point[0][0]
            centroid[1] = centroid[1] + point[0][1]
            centroid[2] = centroid[2] + point[0][2]
            
        centroid[0] = centroid[0]/len(group)
        centroid[1] = centroid[1]/len(group)
        centroid[2] = centroid[2]/len(group)
        fixations.append(centroid)
    return fixations

print (iterativeVelocityThreshold([
    (1512264894, 30, 27),
    (1512264904, 35, 27),
    (1512264914, 39, 30),
    (1512264924, 30, 31),
    (1512264934, 40, 35),
    (1512264944, 300, 27),
    (1512264954, 315, 27),
    (1512264964, 320, 27),
    (1512264974, 317, 27)
], 0.9))