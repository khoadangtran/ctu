from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import AdaBoostClassifier
from sklearn.metrics import accuracy_score, confusion_matrix
import numpy as np


def load_dataset(filename):
 
    data = np.genfromtxt(filename, delimiter=' ')
    X = data[:, :-1]
    y = data[:, -1].astype(int)
    return X, y

# Load datasets
datasets = [
    ("D:/CT205H-ThầyNghi/data/fp107/fp107.trn", "D:/CT205H-ThầyNghi/data/fp107/fp107.tst"),
]
for train_path, test_path in datasets:
    X_train, y_train = load_dataset(train_path)  
    X_test, y_test = load_dataset(test_path)  
    
    
    dtree=DecisionTreeClassifier()
    dtree.fit(X_train,y_train)
    pred=dtree.predict(X_test)

    
    cm = confusion_matrix(y_test,pred)
    acc=accuracy_score(y_test,pred)
    print(train_path)
    print(f"Accuracy: {acc}")

    print(f"Confusion Matrix:\n{cm}\n\n")
    