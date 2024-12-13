
import numpy as np;

# dataset
X_train = np.array([[0.376, 0.488],
                    [0.312, 0.544],
                    [0.298, 0.624],
                    [0.394, 0.600],
                    [0.506, 0.512],
                    [0.488, 0.334],
                    [0.478, 0.398],
                    [0.606, 0.366],
                    [0.428, 0.294],
                    [0.542, 0.252]])

Y_train = np.array([0, 0, 0, 0, 0, 1, 1, 1 , 1, 1])

# testSets
X_test = np.array([[0.55, 0.364],
                   [0.558, 0.47],
                   [0.456, 0.45],
                    [0.45, 0.57]])


# def euclidean_distance(point1, point2):
#     return np.sqrt(np.sum((point1 - point2)**2))

#d is manhattan distance
def dManhattan(p1, p2):
        return np.sum(np.abs(p1 - p2))

# 1NN
def classify_1nn(X_train, Y_train, X_test):
    predictions = []
    for testP in X_test:
        distances = [dManhattan(testP, x) for x in X_train]
        # print("Distances:", distances)
        nearest_index = np.argmin(distances)
        # print('Minimum value at index',nearest_index)
        predictions.append(Y_train[nearest_index])
    return predictions

# 3NN
def classify_3nn(X_train, Y_train, X_test):
    predictions = []
    for testP in X_test:
        distances = [dManhattan(testP, x) for x in X_train]
        # print("Distances:", distances)
        nearest_indices = np.argsort(distances)[:3]
        nearest_classes = Y_train[nearest_indices]
        # print('Compare 3 values ',nearest_classes)
        predictions.append(np.argmax(np.bincount(nearest_classes)))
    return predictions

# predict with  1NN
pre_1nn = classify_1nn(X_train, Y_train, X_test)
print('1NN Predictions:', pre_1nn)

# predict with  3NN
pre_3nn = classify_3nn(X_train, Y_train, X_test)
print('3NN Predictions:', pre_3nn)

