dlugosc2(L, N) :- dlugosc2(L, 0, N).
dlugosc2([], N, N).
dlugosc2([H|T], M, N) :- M1 is M + 1, dlugosc2(T, M1, N).

reverse2(X, Y) :- reverse2(X, [], Y).
reverse2([], Y, Y).
reverse2([X|Xs], Y, Z) :- reverse2(Xs, [X|Y], Z).

silnia(X, Y) :- silnia(X, 1, Y).
silnia(0, Y, Y).
silnia(X, A, Y) :- X > 0, X1 is X - 1, A1 is A * X, silnia(X1, A1, Y).

%% fib2(N, L) :- fib2(N, 1, 1, [1], L).
%% fib2(1, _, _, L, L).
%% fib2(N, A, B, [F|Fs], L) :- N > 1, N1 is N - 1, B1 is A + B, A1 is B, fib2(N1, A1, B1, [A1,F|Fs], L).

%% fib(N, L) :- fib2(N, [H|T]), L is H.

fib(N, R) :- fib(N, 0, 1, R).
fib(0, Prev, Next, Prev).
fib(N, Prev, Next, Res) :- N > 0, N1 is N - 1, Sum is Prev + Next, fib(N1, Next, Sum, Res).

% liczba_wezlow_w_drzewie(dr(a, dr(b, nil, nil), dr(c, dr(d, nil, nil), nil))).
%
%     a
%    / \
%   b   c
%      /
%     d
%
% wezly(dr(a, dr(b, nil, nil), dr(c, dr(d, nil, nil), nil)), N) == 4.

at(0, [H|T], H).
at(N, [H|T], L) :- N > 0, N1 is N - 1, at(N1, T, L).

przekatna(M, P) :- przekatna2(0, M, [], P1), reverse2(P1, P).
przekatna2(_, [], P, P).
przekatna2(N, [R|Rs], P, Res) :- at(N, R, E), N1 is N + 1, append([E], P, P1), przekatna2(N1, Rs, P1, Res).

splaszcz(L, R) :- splaszcz(L, [], R1), reverse(R1, R).
splaszcz([], R, R).
splaszcz([H|T], L, R) :- is_list(H), splaszcz(H, L, R1), splaszcz(T, R1, R).
splaszcz([H|T], L, R) :- not(is_list(H)), splaszcz(T, [H|L], R).

liczba_wezlow(nil, 0, 0).
liczba_wezlow(d(_, nil, A), C, N) :- C1 is 1 + C, liczba_wezlow(A, C1, N).
liczba_wezlow(d(_, A, nil), C, N) :- C1 is 1 + C, liczba_wezlow(A, C1, N).
liczba_wezlow(d(_, A, B), C, N) :- C1 is 1 + C, liczba_wezlow(A, 0, N1), liczba_wezlow(B, 0, N2), N is C1 + N1 + N2.
liczba_wezlow(D, N) :- once(liczba_wezlow(D, 0, N)).
