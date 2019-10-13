:-style_check(-singleton).
:- ['../Utils.pl'].

remove_every_other([], []).
remove_every_other([H], [H]).
remove_every_other([H,_|T1], [H|T2]) :- remove_every_other(T1, T2).