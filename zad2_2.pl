delta(A, B, C, D) :- D is (B * B) - (4 * A * C).
pierw(A, B, C, X) :- delta(A, B, C, D), D >= 0, X is ((B * -1 - sqrt(D)) / (2 * A)); delta(A, B, C, D), D > 0, X is ((B * -1 + sqrt(D)) / (2 * A)).