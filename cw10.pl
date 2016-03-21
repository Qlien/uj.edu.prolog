:- use_module(library(clpfd)).

z1a(Vars) :-
	z1a_sol(Vars),
	label(Vars),
	writeln(Vars).

z1a_sol(Vars) :-
	Vars = [T,E,S,J,U,P,R],
	Vars ins 0..9,
	T #\= 0, J #\= 0,
	all_different(Vars),
	(T + 10 * S + 100 * E + 1000 * T) +
	(T + 10 * S + 100 * E + 1000 * J) #=
	(R + 10 * E + 100 * P + 1000 * U + 10000 * S).

z1b(Vars) :-
	z1b_sol(Vars),
	label(Vars),
	writeln(Vars).

z1b_sol(Vars) :-
	Vars = [D,O,M,I,A,S,T],
	Vars ins 0..9,
	D #\= 0, M #\= 0,
	(100 * D + 10 * O + M) *
	(100 * D + 10 * O + M) #=
	(100000 * M + 10000 * I + 1000 * A + 100 * S + 10 * T + O).

z1c(Vars) :-
	z1c_sol(Vars),
	label(Vars),
	writeln(Vars).

z1c_sol(Vars) :-
	Vars = [X,Y],
	Vars ins 1..9,
	all_different(Vars),
	(X) + ((Y + Y * 10 + Y * 100 + Y * 1000) * 4) #=
	(Y + Y * 10 + Y * 100 + Y * 1000 + X * 10000).

z1d(Vars) :-
	z1d_sol(Vars),
	label(Vars),
	writeln(Vars).

z1d_sol(Vars) :-
	Vars = [A,M,C,W,D,T,L,G],
	Vars ins 0..9,
	G #\= 0,
	all_different(Vars),
	(A*M) - (C*W) #= (C*A),
	M + (D*T) #= (D*L),
	(A*M) / G #= (M*D).

z2 :-
	Vars = [X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12],
	Vars ins 1..12,
	all_different(Vars),
	X1 + X8 + X9 + X3 #= 26,
	X1 + X7 + X12 + X5 #= 26,
	X6 + X7 + X8 + X2 #= 26,
	X2 + X9 + X10 + X4 #= 26,
	X4 + X11 + X12 + X6 #= 26,
	X5 + X11 + X10 + X3 #= 26,
	label(Vars),
	writeln(Vars).
	