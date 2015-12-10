silnia(X, Y) :- silnia(X, 1, Y).
silnia(0, Y, Y).
silnia(X, A, Y) :- X > 0, X1 is X - 1, A1 is A * X, silnia(X1, A1, Y).

fib(N, R) :- fib(N, 0, 1, R).
fib(0, Prev, Next, Prev).
fib(N, Prev, Next, Res) :- N > 0, N1 is N - 1, Sum is Prev + Next, fib(N1, Next, Sum, Res).
