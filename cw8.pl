% wygrywa(L, K, X) :- sprawdz(L, K, [X], 1, Winner).

% czy wygrywa pierwszy gracz
% jesli wezmiemy liczbe X, to sprawdzic nalezy czy przegramy dla K - X

sprawdz(L, K, Sel, Player, Winner) :- list_max(L, MaxL), MaxL >= K, Winner is Player; list_diff(L, Sel, L1), list_max(L1, MaxL1), sprawdz(L1, K, [MaxL1|Sel], ((Player =:= 1) -> 2; 1), Winner).

memberchk(X, [Y|Ys]) :- (X == Y -> true; memberchk(X, Ys)).

list_diff([], _, []).
list_diff([X|Xs], Ys, L) :- (memberchk(X, Ys) -> list_diff(Xs, Ys,L); L = [X|T], list_diff(Xs, Ys, T)).

list_sum([], 0).
list_sum([X], X).
list_sum([H1,H2|T], Sum) :- S is H1 + H2, list_sum([S|T], Sum).

list_max([], 0).
list_max([X], X).
list_max([H1,H2|T], Max) :- (H1 < H2 -> list_max([H2|T], Max); list_max([H1|T], Max)).
