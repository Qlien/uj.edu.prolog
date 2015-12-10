split2(Filename, FilenameA, FilenameB) :- read_chars(Filename, S1), atom_chars(S1, S), sub0_split2(S, A, B), write_chars(A, FilenameA), write_chars(B, FilenameB).

read_chars(Filename, S) :- open(Filename, read, Inf), sub0_read_chars(Inf, S), close(Inf).
sub0_read_chars(Inf, S) :- sub_read_chars(Inf, S).
sub_read_chars(Inf, Res) :-
    get_char(Inf, C),
    sub1_read_chars(C, Cs, Inf),
    atom_chars(Res, Cs).

sub1_read_chars(end_of_file, [], _) :- !.
sub1_read_chars(C, [C|Cs], Inf) :- get_char(Inf, C1), sub1_read_chars(C1, Cs, Inf).

write_chars(S, Filename) :- open(Filename, write, Outf), sub_write_chars(Outf, S), close(Outf).
sub_write_chars(_, []).
sub_write_chars(Outf, [C|Cs]) :- put_char(Outf, C), sub_write_chars(Outf, Cs).

sub0_split2(S, A, B) :- sub_split2(S, [], [], A, B).
sub_split2([], A, B, A, B).
sub_split2([C], A, B, [C|A], B).
sub_split2([C1,C2|Cs], A, B, R1, R2) :- sub_split2(Cs, [C1|A], [C2|B], R1, R2).

% ------------------

% subst(siostra(ala, ola), ala, hemenegilda, W), subst(W, siostra, sister, Z)
% W = siostra(hermenegilda, ola),
% Z = sister(hermenegilda, ola),
%
% subst((a+1)*(a+5), a, 2, W), subst(W,*,/,Z).
% W = (2+1)*(2+5),
% Z=(2+1)/(2+5).

subst(T, A, V, R) :- sub0_subst(T, A, V, [], R).
sub0_subst(Term, Subject, Replacement, Acc, Result) :- Term =.. L, sub1_subst(L, Subject, Replacement, Acc, Res), Result =.. Res.
sub1_subst([], _, _, Acc, Acc).
sub1_subst([H|T], S, R, Acc, Result) :- atomic(H), sub2_subst([H], S, R, Acc, Res1), sub1_subst(T, S, R, Acc, Res2), append(Res1, Res2, Result), !.
sub1_subst([H|T], S, R, Acc, Result) :- not(atomic(H)), H =.. L1, sub1_subst(L1, S, R, Acc, Res1), sub1_subst(T, S, R, Acc, Res2), T1 =.. Res1, Result = [T1|Res2], !.
sub2_subst([], _, _, Acc, Acc).
sub2_subst([S|T], S, Repl, Acc, Res) :- sub2_subst(T, S, Repl, [Repl|Acc], Res).
sub2_subst([H|T], S, Repl, Acc, Res) :- sub2_subst(T, S, Repl, [H|Acc], Res).

% -------------------
%
% rysuj(d(a, d(b, d(c), d(d)), d(e, d(f), d(g)), d(h)))
%

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
