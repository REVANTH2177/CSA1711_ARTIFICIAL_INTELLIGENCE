
import numpy as np
from sklearn.neural_network import MLPClassifier

# Input data (AND gate)
X = np.array([
    [0, 0],
    [0, 1],
    [1, 0],
    [1, 1]
])

# Expected output
y = np.array([0, 0, 0, 1])

# Create Feed Forward Neural Network
model = MLPClassifier(
    hidden_layer_sizes=(4,),
    activation='relu',
    solver='lbfgs',
    max_iter=2000,
    random_state=42
)

# Train the network
model.fit(X, y)

# Predict output
prediction = model.predict(X)

print("Feed Forward Neural Network")
print("Input  -> Predicted Output")

for i in range(len(X)):
    print(X[i], "->", prediction[i])

print("Accuracy:", model.score(X, y) * 100, "%")
