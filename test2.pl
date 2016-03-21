codrugi(L, Res) :- codrugi(L, [], Res).
codrugi([], Tmp, Tmp).
codrugi([A], Tmp, Res) :- append(Tmp, [A], Res).
codrugi([A,_|T], Tmp, Res) :- append(Tmp, [A], Tmp1), codrugi(T, Tmp1, Res).
append([], L, L).
append([H|L1], L2, [H|L3]) :- append(L1, L2, L3).

codrugi2(L, Res) :- codrugi(L, [], Res).
cordugi2([], Tmp, Res) :- reverse(Tmp, Res).
codrugi2([A], Tmp, Res) :- reverse([A|Tmp], Res).
codrugi2([A,_|T], Tmp, Res) :- codrugi(T, [A|Tmp], Res).
reverse([], []).
reverse(L, Res) :- reverse(L, [], Res).
reverse([], Res, Res).
reverse([H|T], Acc, Res) :- reverse(T, [H|Acc], Res).

a(1,2).
a(1,3).
a(2,4).
a(3,6).
a(2,6).
a(1,6).
b(X,Y) :- a(X,Y).
b(X,Y) :- a(X,Z), b(Z,Y).

				% b(1, X) = ?

				% X=2, X=3, X=6, X=4, X=6, X=6

a1(1).
a1(2).
a1(3).
b1(4).
b1(5).
b1(6).
a1 :- !, a1(X), write(X), !, b1(Y), write(Y), fail.

append2(A-B, B-C, A-C).