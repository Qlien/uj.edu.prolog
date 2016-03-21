% wygrywa(L, K, X) :- sprawdz(L, K, [X], 1, Winner).

% czy wygrywa pierwszy gracz
% jesli wezmiemy liczbe X, to sprawdzic nalezy czy przegramy dla K - X

% sprawdz(L, K, Sel, Player, Winner) :- list_max(L, MaxL), MaxL >= K, Winner is Player; list_diff(L, Sel, L1), list_max(L1, MaxL1), sprawdz(L1, K, [MaxL1|Sel], ((Player =:= 1) -> 2; 1), Winner).

% memberchk(X, [Y|Ys]) :- (X == Y -> true; memberchk(X, Ys)).

%list_diff([], _, []).
%list_diff([X|Xs], Ys, L) :- (memberchk(X, Ys) -> list_diff(Xs, Ys,L); L = [X|T], list_diff(Xs, Ys, T)).

%list_sum([], 0).
%list_sum([X], X).
%list_sum([H1,H2|T], Sum) :- S is H1 + H2, list_sum([S|T], Sum).

% findX(L, K, X) :- findX(L, K, 1, X).
% findX(L, K, Y, X) :- list_min(L, M), N is (K - (M * Y)), (not(member(N, L)) -> findX(L, K, Y + 1, X); X is Y, !).

wygrywa(L, K, X) :- find_first_for_a(K, L, L, Z), (integer(X) -> Z =:= X; X is Z).

find_first_for_a(_, _, [], none).
find_first_for_a(K, L, [H|T], Res) :- find_winner(K - H, L, a, Z), (Z =:= a -> Res is H; find_first_for_a(K, L, T, Res)).

next_player(a, b).
next_player(b, a).

is_member(E, [E|_], true).
is_member(E, [_|T], R) :- is_member(E, T, R).
% is_member(E, L, X) :- X is member(E, L).

find_winner(R, L, Player, Res) :- (member(R, L) -> Res is Player; next_move(R, L, X), next_player(Player, Player2), find_winner(R - X, L, Player2, Res)).

% next_move(R, L, X) :- sub_next_move1(R, L, Y)
next_move(R, L, Y) :- once(sub_next_move2(L, R, L, [], X)), sub_next_move3(L, X, Y). 
sub_next_move2(_, _, [], Lres, Lres).
sub_next_move2(L, R, [H|T], Lres, Res) :- RH is R - H, member(RH, L), sub_next_move2(L, R, T, Lres, Res); sub_next_move2(L, R, T, [H|Lres], Res).
sub_next_move3(L, [], Res) :- list_max(L, Res).
sub_next_move3(_, X, Res) :- list_min(X, Res).

list_min([X], X).
list_min([H1,H2|T], Min) :- (H1 < H2 -> list_min([H1|T], Min); list_min([H2|T], Min)).

list_max([X], X).
list_max([H1,H2|T], Max) :- (H1 < H2 -> list_max([H2|T], Max); list_max([H1|T], Max)).
