% zadanie 2.1

wiekszy(X, X, 0).
wiekszy(X, Y, Z) :- X > Y, Z is X; X < Y, Z is Y.

modul(X, Y) :- X < 0, Y is X * -1; X >= 0, Y is X.

sum(0, 0).
sum(N, S) :- N > 0, N1 is N - 1, sum(N1, S1), S is N + S1.

% zadanie 2.2

delta(A, B, C, D) :- D is (B * B) - (4 * A * C).
pierw(A, B, C, X) :- delta(A, B, C, D), D >= 0, X is ((B * -1 - sqrt(D)) / (2 * A)); delta(A, B, C, D), D > 0, X is ((B * -1 + sqrt(D)) / (2 * A)).

% zadanie 2.3

collatz1(1).
collatz1(A) :- R is mod(A, 2), R == 0, A1 is A / 2, writeln(A1), collatz(A1); R is mod(A, 2), R > 0, A1 is (3 * A) + 1, writeln(A1), collatz(A1).

collatz2(1, 1).
collatz2(A, N) :- R is mod(A, 2), R == 0, A1 is A / 2, collatz2(A1, N1), N is N1 + 1.
collatz2(A, N) :- R is mod(A, 2), R > 0, A1 is (3 * A) + 1, collatz2(A1, N1), N is N1 + 1.

% zadanie 2.4

binom(K, 0, X) :- K > 0, X is 1.
binom(K, K, X) :- K > 0, X is 1.
binom(K, L, X) :- L =\= K, L =\= 0, K1 is K - 1, L1 is L - 1, binom(K1, L1, X1), binom(K1, L, X2), X is X1 + X2.
