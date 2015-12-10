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