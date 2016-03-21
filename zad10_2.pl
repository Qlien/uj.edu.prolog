:- use_module(library(clpfd)).

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