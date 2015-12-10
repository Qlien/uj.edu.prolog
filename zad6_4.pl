splaszcz(L, R) :- splaszcz(L, [], R1), reverse(R1, R).
splaszcz([], R, R).
splaszcz([H|T], L, R) :- is_list(H), splaszcz(H, L, R1), splaszcz(T, R1, R).
splaszcz([H|T], L, R) :- not(is_list(H)), splaszcz(T, [H|L], R).