split2(Filename, FilenameA, FilenameB) :- read_chars(Filename, S1), atom_chars(S1, S), sub0_split2(S, A, B), write_chars(A, FilenameA), write_chars(B, FilenameB).

read_chars(Filename, S) :- open(Filename, read, Inf), sub0_read_chars(Inf, S), close(Inf).
sub0_read_chars(Inf, S) :- sub_read_chars(Inf, S).
sub_read_chars(Inf, Res) :-
    get_char(Inf, C),
    sub1_read_chars(C, Cs, Inf),
    atom_chars(Res, Cs).

sub1_read_chars(end_of_file, [], _) :- !.
sub1_read_chars(C, [C|Cs], Inf) :- get_char(Inf, C1), sub1_read_chars(C1, Cs, Inf).

write_chars(S, Filename) :- open(Filename, write, Outf), sub_write_chars(Outf, S), close(Outf).
sub_write_chars(_, []).
sub_write_chars(Outf, [C|Cs]) :- put_char(Outf, C), sub_write_chars(Outf, Cs).

sub0_split2(S, A, B) :- sub_split2(S, [], [], A, B).
sub_split2([], A, B, A, B).
sub_split2([C], A, B, [C|A], B).
sub_split2([C1,C2|Cs], A, B, R1, R2) :- sub_split2(Cs, [C1|A], [C2|B], R1, R2).