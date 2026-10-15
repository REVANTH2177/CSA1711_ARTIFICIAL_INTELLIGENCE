
import math

def alpha_beta(depth, index, maximizing, scores,
               alpha, beta, height):

    if depth == height:
        return scores[index]

    if maximizing:
        best = -math.inf

        for i in range(2):
            value = alpha_beta(
                depth + 1, index * 2 + i,
                False, scores, alpha, beta, height
            )

            best = max(best, value)
            alpha = max(alpha, best)

            if beta <= alpha:
                break

        return best

    else:
        best = math.inf

        for i in range(2):
            value = alpha_beta(
                depth + 1, index * 2 + i,
                True, scores, alpha, beta, height
            )

            best = min(best, value)
            beta = min(beta, best)

            if beta <= alpha:
                break

        return best


scores = [3, 5, 2, 9, 12, 5, 23, 23]
height = int(math.log2(len(scores)))

print("Alpha-Beta Pruning Algorithm")
print("Leaf Node Values:", scores)

result = alpha_beta(
    0, 0, True, scores,
    -math.inf, math.inf, height
)

print("Optimal Value:", result)
