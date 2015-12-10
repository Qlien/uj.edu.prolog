binom(K, 0, X) :- K > 0, X is 1.
binom(K, K, X) :- K > 0, X is 1.
binom(K, L, X) :- L =\= K, L =\= 0, K1 is K - 1, L1 is L - 1, binom(K1, L1, X1), binom(K1, L, X2), X is X1 + X2.