liczba_wezlow(nil, 0, 0).
liczba_wezlow(d(_, nil, A), C, N) :- C1 is 1 + C, liczba_wezlow(A, C1, N).
liczba_wezlow(d(_, A, nil), C, N) :- C1 is 1 + C, liczba_wezlow(A, C1, N).
liczba_wezlow(d(_, A, B), C, N) :- C1 is 1 + C, liczba_wezlow(A, 0, N1), liczba_wezlow(B, 0, N2), N is C1 + N1 + N2.
liczba_wezlow(D, N) :- once(liczba_wezlow(D, 0, N)).