
from sklearn.tree import DecisionTreeClassifier

# Training data: [Hours Studied, Attendance]
X = [
    [1, 40],
    [2, 50],
    [3, 60],
    [4, 70],
    [5, 80],
    [6, 90]
]

# Target: 0 = Fail, 1 = Pass
y = [0, 0, 0, 1, 1, 1]

# Create and train the Decision Tree
model = DecisionTreeClassifier(random_state=42)
model.fit(X, y)

# Predict result for a new student
student = [[5, 85]]
prediction = model.predict(student)

print("Decision Tree Algorithm")
print("Hours Studied:", student[0][0])
print("Attendance:", student[0][1])

if prediction[0] == 1:
    print("Prediction: Pass")
else:
    print("Prediction: Fail")
