robot(X) :- robot_expr(X, []).
robot_expr --> [idz], num; [idz], num, robot_expr.
robot_expr --> [skrec], direction; [skrec], direction, robot_expr.
num --> [D], {number(D)}.
direction --> [prawo].
direction --> [lewo].

robot2(S, P, K) :- robot2_expr(S, K, P, []).
robot2_expr(P, K) --> robot2_move_expr(P, K); robot2_move_expr(P, K1), robot2_expr(K1, K).
robot2_expr(P, K) --> robot2_turn_expr(P, K); robot2_turn_expr(P, K1), robot2_expr(K1, K).

robot2_move_expr(P, K) --> [idz], [N], {number(N), robot2_move(P, N, K)}.
robot2_turn_expr(P, K) --> [skrec], [D], {direction([D], []), robot2_turn(P, D, K)}.

robot2_turn([X0, Y0, Dir0], D, [X0, Y0, Dir1]) :-
    Dir0 == n, D == prawo, Dir1 = e;
    Dir0 == n, D == lewo, Dir1 = w;
    Dir0 == e, D == prawo, Dir1 = s;
    Dir0 == e, D == lewo, Dir1 = n;
    Dir0 == s, D == prawo, Dir1 = w;
    Dir0 == s, D == lewo, Dir1 = e;
    Dir0 == w, D == prawo, Dir1 = n;
    Dir0 == w, D == lewo, Dir1 = s.

robot2_move([X0, Y0, Dir], N, [X1, Y1, Dir]) :-
    Dir == n, Y1 is Y0 + N, X1 is X0;
    Dir == e, X1 is X0 + N, Y1 is Y0;
    Dir == s, Y1 is Y0 - N, X1 is X0;
    Dir == w, X1 is X0 - N, Y1 is Y0.

prop(Expr, X) :- prop_expr(X, Expr, []).
prop_expr(X) --> "(", prop_expr(X), ")".
prop_expr(X) --> " ", prop_expr(X); prop_expr(X), " "; " ", prop_expr(X), " ".
prop_expr(X) --> prop_expr(X1), or_op, prop_expr(X2), {or_op_impl(X1, X2, X)}.
prop_expr(X) --> prop_expr(X1), and_op, prop_expr(X2), {and_op_impl(X1, X2, X)}.
prop_expr(X) --> not_op, prop_expr(X1), {not_op_impl(X1, X)}.
or_op --> "or ".
and_op --> "and ".
not_op --> "not ".
or_op_impl(0, 0, 0).
or_op_impl(0, 1, 1).
or_op_impl(1, 0, 1).
or_op_impl(1, 1, 1).
and_op_impl(0, 0, 0).
and_op_impl(0, 1, 0).
and_op_impl(1, 0, 0).
and_op_impl(1, 1, 1).
not_op_impl(0, 1).
not_op_impl(1, 0).