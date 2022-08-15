# minball
A faster dual algorithm for the Euclidean minimum covering ball problem

## Introduction
Dearing and Zeck (Oper Res Lett 37(3):171–175, 2009) presented a dual algorithm for the problem of the minimum covering ball in R^n. Each iteration of their algorithm has a computational complexity of at least 𝒪(𝑛^3). We propose a modification to their algorithm that, together with an implementation that uses updates to the QR factorization of a suitable matrix, achieves a 𝒪(𝑛^2) iteration.

For further information on the algorithm, please consult the respective paper (see Reference / Citation).

## Running the code
To run the code, call function `minBallDualAlg_CA`:  `[x_opt, r_opt, iter, time] = minBallDualAlg_CA (P)`

### Input of run_MinkBall
- P ~ matrix containing the data points - each column corresponds to a point.

### Output of run_MinkBall
- x_opt ~ center of the minimum ball;
- r_opt ~ radius of the minimum ball;
- S_opt ~ a support set of the minimum ball;
- iter ~ number of iterations;
- time ~ CPU time.

## Reference / Citation:
[Cavaleiro, M., Alizadeh, F. A faster dual algorithm for the Euclidean minimum covering ball problem. Annals of Operations Research (2018).](https://link.springer.com/article/10.1007/s10479-018-3123-5)
