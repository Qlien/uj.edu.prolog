permutacja([], []).
permutacja(Xs, [Z|Zs]) :- usun(Z, Xs, Ys), permutacja(Ys, Zs).

usun(X, [X|Xs], Xs).
usun(X, [Y|Ys], [Y|Zs]) :- usun(X, Ys, Zs).

pow10(N, R) :- pow10(N, 1, R), !.
pow10(0, R, R).
pow10(N, R, Res) :- N1 is N - 1, R1 is R * 10, pow10(N1, R1, Res), !.

slowo(Ls, Res) :- reverse(Ls, RevLs), slowo(RevLs, 0, 0, Res).
slowo([], _, R, R).
slowo([H|T], N, R, Res) :- pow10(N, K), Li is K*H, N1 is N+1, R1 is R+Li, slowo(T, N1\
, R1, Res).

z92a :- permutacja([0,1,2,3,4,5,6,7,8,9], X),
        [T, E, S, J, U, P, R|_] = X,
        slowo([T, E, S, T], X1),
        slowo([J, E, S, T], X2),
        slowo([S, U, P, E, R], X3),
        X3 =:= X1 + X2,
        writeln(X1 + X2 = X3).

z92b :- permutacja([0,1,2,3,4,5,6,7,8,9], X),
        [D, O, M, I, A, S, T|_] = X,
        slowo([D, O, M], X1),
        slowo([M, I, A, S, T, O], X2),
        X2 =:= X1 * X1,
        writeln(X1 * X1 = X2).