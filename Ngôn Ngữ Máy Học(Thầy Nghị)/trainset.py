
    

from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import AdaBoostClassifier
from sklearn.metrics import accuracy_score, confusion_matrix
import numpy as np


def load_dataset(filename):
 
    data = np.genfromtxt(filename, delimiter=',')
    X = data[:, :-1]
    y = data[:, -1].astype(int)
    return X, y

# Load datasets
datasets = [
    ("D:/CT205H-ThầyNghi/data/iris/iris.trn", "D:/CT205H-ThầyNghi/data/iris/iris.tst"),
    ("D:/CT205H-ThầyNghi/data/optics/opt.trn", "D:/CT205H-ThầyNghi/data/optics/opt.tst"),
    ("D:/CT205H-ThầyNghi/data/letter/let.trn", "D:/CT205H-ThầyNghi/data/letter/let.tst"),
    ("D:/CT205H-ThầyNghi/data/fp/fp.trn", "D:/CT205H-ThầyNghi/data/fp/fp.tst"),
    ("D:/CT205H-ThầyNghi/data/leukemia/ALLAML.trn", "D:/CT205H-ThầyNghiD/data/leukemia/ALLAML.tst"),
]
for train_path, test_path in datasets:
    X_train, y_train = load_dataset(train_path)  
    X_test, y_test = load_dataset(test_path)  
    
    
    dtree=DecisionTreeClassifier()
    # boosttree = AdaBoostClassifier()
    # boosttree.fit(X_train,y_train)
    # pred=boosttree.predict(X_test)
    dtree.fit(X_train,y_train)
    pred=dtree.predict(X_test)
    cm = confusion_matrix(y_test,pred)
    acc=accuracy_score(y_test,pred)
    print(train_path)
    print(f"Accuracy: {acc}")

    print(f"Confusion Matrix:\n{cm}\n\n")
    