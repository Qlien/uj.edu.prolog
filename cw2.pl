pow2(X, Y) :- Y is X * X.

fib(N, F) :- N = 0, F = 0.
fib(N, F) :- N = 1, F = 1.
fib(N, F) :- N > 1, N1 is N - 1, fib(N1, F1), N2 is N - 2, fib(N2, F2), F is F1 + F2.

krawedz(a, b).
krawedz(b, c).
krawedz(b, d).
krawedz(c, e).
krawedz(c, f).
krawedz(d, f).
krawedz(f, e).

sciezka(X, Y) :- krawedz(X, Y); krawedz(X, Z), sciezka(Z, Y).

sciezka(X, Y, Z) :- krawedz(X, Z), krawedz(Z, Y); sciezka(X, Z), sciezka(Z, Y).
sciezka3() :- krawedz(X, Y), krawedz(Y, Z), krawedz(Z, f).

% for loops
% krawedz(e, c).
cykl() :- sciezka(X, X, Z).

sciezka_dl(X, Y, N) :- N = 1, krawedz(X, Y).
sciezka_dl(X, Y, N) :- N > 1, N1 is N - 1, krawedz(X, Z), sciezka_dl(Z, Y, N1).

% sciezka_dl(a, b, 1).
% sciezka_dl(a, c, 2).
% sciezka_dl(a, e, 3).
% sciezka_dl(a, f, 3).
% sciezka_dl(a, e, 3).
% sciezka_dl(a, e, 4).
% sciezka_dl(a, e, 2). % false.

sciezka_dl(X, f, 4).
sciezka_dl(a, X, 3).
sciezka_dl(X, Y, 3).

% nie mozna znalesc dlugosci sciezki od a do e, przeciez predykat jest zdefiniowany w taki sposob, zeby nie liczyc argument N.

dl_sciezki(X, Y, N) :- N = 1, krawedz(X, Y).
dl_sciezki(X, Y, N) :- krawedz(X, Z), dl_sciezki(Z, Y, N1), N is N1 + 1.
