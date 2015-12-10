dziecko(magda, ala).
dziecko(magda, jacek).
dziecko(michal, ala).
dziecko(michal, jacek).

dziecko(czarek, wanda).
dziecko(czarek, karol).
dziecko(roman, wanda).
dziecko(roman, karol).

dziecko(franek, witold).
dziecko(franek, zuzanna).
dziecko(kunegunda, witold).
dziecko(kunegunda, zuzanna).

dziecko(onufry, magda).
dziecko(onufry, mariusz).
dziecko(aneta, magda).
dziecko(aneta, mariusz).

dziecko(ewa, onufry).
dziecko(ewa, ola).
dziecko(nina, onufry).
dziecko(nina, ola).

meszczyzna(czarek).
meszczyzna(roman).
meszczyzna(karol).
meszczyzna(franek).
meszczyzna(witold).
meszczyzna(onufry).
meszczyzna(mariusz).

kobieta(kunegunda).
kobieta(zuzanna).
kobieta(wanda).
kobieta(magda).
kobieta(aneta).
kobieta(nina).
kobieta(ewa).
kobieta(ola).

syn(X, Y) :- dziecko(X, Y), meszczyzna(X).
corka(X, Y) :- dziecko(X, Y), kobieta(X).
wnuk(X, Y) :- dziecko(X, Z), dziecko(Z, Y), meszczyzna(X).
dziadek(X, Y) :- dziecko(Y, Z), dziecko(Z, X), meszczyzna(X).
dziadek(X) :- dziecko(Z, Y), dziecko(Y, X), meszczyzna(X).
potomek(X, Y) :- dziecko(X, Y); dziadek(Y, X); dziecko(X, Z), potomek(Z, Y).

% Czy Karol jest mężczyzną?
?- meszczyzna(karol).

% Czy Zuzanna jest kobietą?
?- kobieta(zuzanna).

% Czyim dzieckiem jest Onufry?
?- dziecko(onufry, X).

% Jakie córki ma Jacek?
?- corka(X, jacek).

% Wypisz wszystkie pary Dziadek-Wnuk
?- wnuk(X, Y).

% Wypisz wszystkich potomków Magdy
?- potomek(X, magda).
