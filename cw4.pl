lacz_listy([], Y, Y).
lacz_listy([H|T], Y, [H|Z]) :- lacz_listy(T, Y, Z).

ostatni_element([A], A).
ostatni_element([H|T], B) :- ostatni_element(T, B).

prefix(A, B) :- lacz_listy(A, X, B).

podlista(A, B) :- lacz_listy(A, X, B); lacz_listy(X, A, B).

wstaw(X, [], [X]).
wstaw(X, [Y|T], [Y|T1]) :- X > Y, wstaw(X, T, T1).
wstaw(X, [Y|T], [X,Y|T]) :- X =< Y.

sub_sort([], X, X).
sub_sort([H|T], X, Y) :- wstaw(H, X, Z), sub_sort(T, Z, Y).

sortuj(X, Y) :- sub_sort(X, [], Y).

is_element(X, [X]).
is_element(X, [X|_]).
is_element(X, [Y|T]) :- is_element(X, T).

usun_pierwszy(X, [X|T], T).
usun_pierwszy(X, [Y|T], [Y|Z]) :- usun_pierwszy(X, T, Z).

usun_wszystkie(X, [], []).
usun_wszystkie(X, [X|T], Z) :- usun_wszystkie(X, T, Z).
usun_wszystkie(X, [Y|T], [Y|Z]) :- X =\= Y, usun_wszystkie(X, T, Z).

podlista2([], []).
podlista2([H|T], Y) :- usun_pierwszy(H, Y, Z), podlista2(T, Z).

permutacja([], []).
permutacja(Z, [H|T]) :- usun_pierwszy(H, Z, Z1), permutacja(Z1, T).

usun_element(X, Y, Z) :- once(usun_pierwszy(Y, X, Z)).

dodaj(X, [], [X]).
dodaj(X, [H|T], [H|L]) :- dodaj(X, T, L).

usun_duplikaty(L, Z) :- sub_usun_duplikaty(L, [], Z).

sub_usun_duplikaty([], Z, Z).
sub_usun_duplikaty([H|T], Acc, Res) :- usun_wszystkie(H, T, Z1), dodaj(H, Acc, Z2), sub_usun_duplikaty(Z1, Z2, Res).
