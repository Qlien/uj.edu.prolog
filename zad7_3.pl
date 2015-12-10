rysuj(Tree) :- sub0_rysuj(Tree, -1).
sub0_rysuj(X, D) :- atomic(X), D1 is D, sub4_rysuj(D1, X).
sub0_rysuj(X, D) :- not(atomic(X)), X =.. [_|T], D1 is D + 1, sub1_rysuj(T, D1).
sub1_rysuj([], _).
%sub1_rysuj([T], D) :- sub2_rysuj(D, T, S), writeln(S).
sub1_rysuj([H|T], D) :- sub0_rysuj(H, D), sub1_rysuj(T, D). % :- sub0_rysuj(H, D), D1 is D + 1, sub1_rysuj(T, D1).
sub2_rysuj(Depth, Symbol, S) :- sub3_rysuj(Depth, "", S1), string_concat(S1, Symbol, S).
sub3_rysuj(0, S, S) :- !.
sub3_rysuj(D, S, S) :- D < 0, !.
sub3_rysuj(Depth, S, Res) :- Depth >= 0, string_concat(" ", S, S1), D1 is Depth - 1, sub3_rysuj(D1, S1, Res).
sub4_rysuj(Depth, Symbol) :- sub2_rysuj(Depth, Symbol, S), writeln(S).