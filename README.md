# minball
A faster dual algorithm for the Euclidean minimum covering ball problem

## Introduction
Dearing and Zeck (Oper Res Lett 37(3):171–175, 2009) presented a dual algorithm for the problem of the minimum covering ball in R^n. Each iteration of their algorithm has a computational complexity of at least 𝒪(𝑛^3). In this paper we propose a modification to their algorithm that, together with an implementation that uses updates to the QR factorization of a suitable matrix, achieves a 𝒪(𝑛2) iteration.
For further information on the algorithm, please consult the respective paper (see Reference / Citation)

## Running the code
To run the code, call function `run_MinkBall`:  `[rOpt, xOpt] = run_MinkBall(P, k, outputfile, options)`

### Input of run_MinkBall
- P ~ matrix containing the data points - each column corresponds to a point (use genRandPoints.m to generate random datasets with specific features);
- k ~ number of points to enclose (1 <= k <= m) by the ball;
- outputfile ~ name of the file to store output info (.mat file);
- options ~ struct containing the options to apply to the algorithm. For a description of the options, see `run_MinkBall.m`.

Notes: 
- If no inputs provided, run_MinkBall will generate a randomly normal dataset of 100 3-dimensional points; k is also random; the default options are used;
- If options is not provided, then the default options will be used.

### Output of run_MinkBall
- rOPT ~ radius of the optimal k-enclosing ball;
- xOPT ~ center of the optimal k-enclosing ball.

## Reference / Citation:
[Cavaleiro, M., Alizadeh, F. A Branch-and-Bound algorithm for the minimum radius k-enclosing ball problem. Operations Research Letters 50(3), 274-280 (2022)](https://www.sciencedirect.com/science/article/abs/pii/S0167637722000323)
