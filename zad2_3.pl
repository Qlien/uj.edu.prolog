collatz1(1).
collatz1(A) :- R is mod(A, 2), R == 0, A1 is A / 2, writeln(A1), collatz(A1); R is mod(A, 2), R > 0, A1 is (3 * A) + 1, writeln(A1), collatz(A1).

collatz2(1, 1).
collatz2(A, N) :- R is mod(A, 2), R == 0, A1 is A / 2, collatz2(A1, N1), N is N1 + 1.
collatz2(A, N) :- R is mod(A, 2), R > 0, A1 is (3 * A) + 1, collatz2(A1, N1), N is N1 + 1.