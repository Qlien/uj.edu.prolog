numeral(0).
numeral(succ(X)) :- numeral(0).

add(0, Y, Y).
add(succ(X), Y, succ(Z)) :- add(X, Y, Z). 

sub(X, X, 0).
sub(succ(X), X, X).
% sub(succ(succ(X)), succ(X), Z) :- sub(X, Y, (succ(X)), succ(X), Z).
% sub(succ(succ(X)), succ(Y), Z) :- sub(X, Y, Z).

% odds([], Z) :- .
odds(Xs, [X2|Zs]) :- odds([X1,X2|Xs], Zs).

dziecko(jan, michal).
dziecko(jan, alicja).
dziecko(michal, ola).
dziecko(alicja, ewa).
wnuk(X, Y) :- dziecko(X, Z), dziecko(Z, Y).
matka(ewa, olek).
matka(adam, olek).
rodzic(X, Y) :- matka(X, Y).
rodzic(X, Y) :- ojciec(X, Y).
