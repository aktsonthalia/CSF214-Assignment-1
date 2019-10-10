member([], Element) :- false.
member([H|T], Element) :- Element is H; member(T, Element).


prefix([], Y).
prefix([H|TX], [H|TY]) :- prefix(TX, TY). 

append([], L, L).
append([H|T], L, Res) :- append(T, L, Res2), Res = [H|Res2].

reverse([], []).
reverse([H|T], L2) :- reverse(T, L3), append(L3, [H], L2). 

suffix(X, Y) :- reverse(Y, Y_rev), reverse(X, X_rev), prefix(X_rev, Y_rev).

sublist(X, Y) :- suffix(Suffix, Y), prefix(X, Suffix).

occurences([], Element, N, N).
occurences([H|T], Element, N, Res) :- (N_updated is N+1, H is Element ; N_updated is N, not(H is Element)), 
									   occurences(T, Element, N_updated, Res).

remove([], Element, Updated_List, Updated_List).
remove([H|T], Element, Updated_List, Res) :- 
(append(Updated_List, [H], Updated_List_New), not(H is Element); 
append(Updated_List, [], Updated_List_New), H is Element), 
remove(T, Element, Updated_List_New, Res).  


len([], 0).
len([_|T], N) :- len(T, X), N is X+1.


isTriplicate(Element, List) :- occurences(List, Element, 0, N), N >= 3.

has_triplicate([]) :- false.
has_triplicate(X) :- member(X, Element), occurences(X, Element, 0, N), N >= 3, write(Element).



obtain_nth([H|T], N, I, Element) :- (I is N, Element is H); (I_updated is I+1), obtain_nth(T, N, I_updated, Element).

remove_nth(N, X, Y) :- len(X, L), L>=N, N1 is N-1, N2 is L - N,
						prefix(SubList1, X), len(SubList1, N1),
						suffix(SubList2, X), len(SubList2, N2),
						append(SubList1, SubList2, Y).
							

