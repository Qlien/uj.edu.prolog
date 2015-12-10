wiekszy(X, X, 0).
wiekszy(X, Y, Z) :- X > Y, Z is X; X < Y, Z is Y.

modul(X, Y) :- X < 0, Y is X * -1; X >= 0, Y is X.

suma(0, 0).
suma(N, S) :- N > 0, N1 is N - 1, suma(N1, S1), S is N + S1.