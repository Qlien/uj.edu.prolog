lancuch(a).
lancuch(b).

lancuch(a(X)) :- lancuch(X).
lancuch(b(X)) :- lancuch(X).

dl_lancucha(a, 1).
dl_lancucha(b, 1).
dl_lancucha(a(X), N) :- dl_lancucha(X, N1), N is N1 + 1.
dl_lancucha(b(X), N) :- dl_lancucha(X, N1), N is N1 + 1.

nty_el_lancucha(a, 1, a).
nty_el_lancucha(b, 1, b).
nty_el_lancucha(a(X), 1, a).
nty_el_lancucha(b(X), 1, b).
nty_el_lancucha(a(X), N, E) :- N1 is N - 1, nty_el_lancucha(X, N1, E).
nty_el_lancucha(b(X), N, E) :- N1 is N - 1, nty_el_lancucha(X, N1, E).

podobne(a, a).
podobne(b, b).
podobne(a(X), a).
podobne(b(X), b).
podobne(a(X), a(Y)).
podobne(b(X), b(Y)).
podobne(a(X), b(Y)) :- podobne(X, Y).
podobne(b(X), a(Y)) :- podobne(X, Y).
