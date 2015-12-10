suma(wektor(X1, Y1, Z1), wektor(X2, Y2, Z2), wektor(Xs, Ys, Zs)) :- Xs is X1 + X2, Ys is Y1 + Y2, Zs is Z1 + Z2.

iloczyn_skalarny(wektor(X1, Y1, Z1), wektor(X2, Y2, Z2), W) :- W is (X1 * X2) + (Y1 * Y2) + (Z1 * Z2).
