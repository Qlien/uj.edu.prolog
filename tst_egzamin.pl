%a(1,2).
%a(1,3).
%a(2,4).
%a(3,6).
%a(2,6).
%a(1,6).
%b(X,Y):-a(X,Y).
%b(X,Y):-a(X,Z),b(Z,Y).

%codrugi(L, X) :- codrugi(L, [], Z), reverse(Z, X).
%codrugi([H1,_|T], X, Res) :- codrugi(T, [H1|X], Res).
%codrugi([H], X, [H|X]).
%codrugi([], X, X).

a(1).
a(2).
a(3).
b(1).
b(2).
b(3).
a :- !, a(X), write(X), !, b(Y), write(Y), fail.
