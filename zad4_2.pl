liczba(0).
liczba(s(X)) :- liczba(X).

dodaj(0, Y, Y).
dodaj(s(X), Y, s(Z)) :- dodaj(X, Y, Z).

mnoz(0, B, 0).
mnoz(A, 0, 0).
mnoz(A, s(B), C) :- mnoz(A, B, C1), dodaj(A, C1, C).

peano_to_decimal(0, 0).
peano_to_decimal(s(X), D) :- peano_to_decimal(X, D1), D is D1 + 1.

decimal_to_peano(1, s(0)).
decimal_to_peano(D, s(P)) :- D > 0, D1 is D - 1, decimal_to_peano(D1, P).
