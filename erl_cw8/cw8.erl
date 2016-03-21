-module(cw8).
-export([solution/2, solution/3, nextPlayer/1, nextMove/2, findWinner/3, findFirstForA/3]).

solution(K, L, X) ->
    findWinner(K - X, L, a) == a.

solution(K, L) ->
    findFirstForA(K, L, L).

nextPlayer(a) -> b;
nextPlayer(b) -> a.

findWinner(R, L, P) ->
    IsMember = lists:member(R, L),
    case IsMember of
	true -> P;
	false -> findWinner(R - nextMove(R, L), L, nextPlayer(P))
    end.

nextMove(R, L) ->
    Cs = lists:filter(fun (E) ->
			not lists:member(R - E, L)
			end,
		L),
    if 
	Cs == [] -> lists:min(L);
        true -> lists:max(Cs)
    end.

findFirstForA(_, _, []) ->
    none;

findFirstForA(K, L, [H|T]) ->
    case findWinner(K - H, L, a) of
	b -> findFirstForA(K, L, T);
	a -> H
    end.
