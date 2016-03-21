concat(A-B, B-C, A-C).
				% rotate(A1-B1, A2-B2) :- L1=[_|L2], concat(L1-L2, L3-L4, A1-B1), writeln(L1), writeln(L2), writeln(L3), writeln(L4), concat(L3-L4, L1-L2, A2-B2).

				% rotate([H|T], R) :- append(T, [H], R).
				% rotate([H|T]-T1, R-S) :- concat(T-T1, [H|L]-L, R-S).
				% rotate([H|T]-[H|L], R-S) :- concat(T-[H|L], [H|L]-L, R-S).
				% rotate([H|T]-[H|L], T-S) :- concat(T-[H|L], [H|L]-L, T-S).
				% rotate([H|T]-[H|L], T-L) :- concat(T-[H|L], [H|L]-L, T-L).
				% === rotate([H|T]-[H|L], T-L), because concat(...) equals that

rotate([H|T]-[H|L], T-L).

				% ----------

% from: Yinfei Yang

createQueue(Q-Q).
isEmptyQueue(Q-T) :- Q == T.
addQueue(E, Q1-[E|T], Q1-T).	% :- concat(Q1-[E|T], [E|T]-T, Q1-T).
delQueue(E, Q1-T, Q2-T) :- not(Q1 == T), Q1 = [E|Q2].

				% ==================

% from: Pawel Fulmanski

permutacja([], []).
permutacja(Xs, [Z|Zs]) :- usun(Z, Xs, Ys), permutacja(Ys, Zs).

usun(X, [X|Xs], Xs).
usun(X, [Y|Ys], [Y|Zs]) :- usun(X, Ys, Zs).

pow10(N, R) :- pow10(N, 1, R), !.
pow10(0, R, R).
pow10(N, R, Res) :- N1 is N - 1, R1 is R * 10, pow10(N1, R1, Res), !.

slowo(Ls, Res) :- reverse(Ls, RevLs), slowo(RevLs, 0, 0, Res).
slowo([], _, R, R).
slowo([H|T], N, R, Res) :- pow10(N, K), Li is K*H, N1 is N+1, R1 is R+Li, slowo(T, N1, R1, Res).

z92a :- permutacja([0,1,2,3,4,5,6,7,8,9], X),
	[T, E, S, J, U, P, R|_] = X,
	slowo([T, E, S, T], X1),
	slowo([J, E, S, T], X2),
	slowo([S, U, P, E, R], X3),
	X3 =:= X1 + X2,
	writeln(X1 + X2 = X3).

z92b :- permutacja([0,1,2,3,4,5,6,7,8,9], X),
	[D, O, M, I, A, S, T|_] = X,
	slowo([D, O, M], X1),
	slowo([M, I, A, S, T, O], X2),
	X2 =:= X1 * X1,
	writeln(X1 * X1 = X2).

				% ----

% from: http://www.cyberforum.ru/prolog/thread1018253.html

digits(['0','1','2','3','4','5','6','7','8','9']).

rebus(TemplateList, Nums) :-
	digits(Digits),
	rebus(TemplateList, Nums, Digits).

sel(X, [X|Tail], Tail).
sel(Elem, [Head|Tail], [Head|Rest]) :-
	    sel(Elem, Tail, Rest).

rebus([], [], _).
rebus([Head|Teil], [Num|Rest], Digits) :-
	make_num(Head, Digits, Digits1),
	number_chars(Num, Head),
	rebus(Teil, Rest, Digits1).

make_num([], Digits, Digits).
make_num([Head|Teil], Digits0, Digits) :-
	var(Head),
	sel(Head, Digits0, Digits1),
	make_num(Teil, Digits1, Digits).

make_num([Head|Teil], Digits0, Digits) :-
	nonvar(Head),
	make_num(Teil, Digits0, Digits).

solve_rebus_a :-
	rebus([[T, E, S, T], [J, E, S, T], [S, U, P, E, R]], [N1, N2, N3]),
	N1 + N2 =:= N3,
	writeln(N1 + N2 = N3).

solve_rebus_b :-
	rebus([[D, O, M], [D, O, M], [M, I, A, S, T, O]], [N1, N2, N3]),
	N1 * N2 =:= N3,
	writeln(N1 * N2 = N3).