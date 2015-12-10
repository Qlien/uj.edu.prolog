przekatna(M, P) :- przekatna2(0, M, [], P1), reverse2(P1, P).
przekatna2(_, [], P, P).
przekatna2(N, [R|Rs], P, Res) :- at(N, R, E), N1 is N + 1, append([E], P, P1), przekatna2(N1, Rs, P1, Res).
