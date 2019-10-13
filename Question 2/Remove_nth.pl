:-style_check(-singleton).
:- ['../Utils.pl'].
:- ['Sublist.pl'].

len([], 0).
len([_|T], N) :- len(T, X), N is X+1.

remove_nth(N, X, Y) :- len(X, L), L>=N, N1 is N-1, N2 is L - N,
						prefix(SubList1, X), len(SubList1, N1),
						suffix(SubList2, X), len(SubList2, N2),
						append(SubList1, SubList2, Y).