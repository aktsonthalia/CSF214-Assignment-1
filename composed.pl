member([], Element) :- false.
member([H|T], Element) :- Element = H; member(T, Element).

prefix([], Y).
prefix([H|TX], [H|TY]) :- prefix(TX, TY). 

append([], L, L).
append([H|T], L, Res) :- append(T, L, Res2), Res = [H|Res2].

reverse([], []).
reverse([H|T], L2) :- reverse(T, L3), append(L3, [H], L2). 

suffix(X, Y) :- reverse(Y, Y_rev), reverse(X, X_rev), prefix(X_rev, Y_rev).

sublist(X, Y) :- suffix(Suffix, Y), prefix(X, Suffix).

occurences([], Element, N, N).
occurences([H|T], Element, N, Res) :- (N_updated is N+1, H = Element ; N_updated is N, not(H = Element)), 
									   occurences(T, Element, N_updated, Res).
remove([], Element, Updated_List, Updated_List).
remove([H|T], Element, Updated_List, Res) :- 
(append(Updated_List, [H], Updated_List_New), not(H = Element); 
append(Updated_List, [], Updated_List_New), H = Element), 
remove(T, Element, Updated_List_New, Res).  

len([], 0).
len([_|T], N) :- len(T, X), N is X+1.

remove_duplicates([], Y, Y).
remove_duplicates([H|T], Y, Res) :- append(Y, [H], Y_updated), remove([H|T], H, [], X_updated), 
									remove_duplicates(X_updated, Y_updated, Res).
isTriplicate(Element, List) :- occurences(List, Element, 0, N), N >= 3.

has_triplicate([]) :- false.
has_triplicate(X) :- remove_duplicates(X, [], X_without_repitition), 
					 member(X_without_repitition, Element), occurences(X, Element, 0, N), N >= 3, write(Element).

obtain_nth([H|T], N, I, Element) :- (I is N, Element = H); (I_updated is I+1), obtain_nth(T, N, I_updated, Element).

remove_nth(N, X, Y) :- len(X, L), L>=N, N1 is N-1, N2 is L - N,
						prefix(SubList1, X), len(SubList1, N1),
						suffix(SubList2, X), len(SubList2, N2),
						append(SubList1, SubList2, Y).
				
remove_every_other([], []).
remove_every_other([H], [H]).
remove_every_other([H,_|T1], [H|T2]) :- remove_every_other(T1, T2).

%weight(+Start, +End, -Weight)
weight(a,b,5).
weight(b,c,5).
weight(c,d,5).
weight(d,e,5).
weight(e,f,51).
weight(f,g,71).
weight(a,c,5).
weight(a,d,5).
weight(b,d,251).
weight(c,e,951).
weight(d,f,251).
weight(g,a,025).



connected(X,Y,D) :- weight(X,Y,D).
connected(X,Y,D) :- weight(Y,X,D).


has_duplicate([]) :- false.
has_duplicate(X) :- remove_duplicates(X, [], X_without_repitition), 
					 member(X_without_repitition, Element), 
					 occurences(X, Element, 0, N), N >= 2.


cost([], Cost, Cost).
cost([H], Cost, Cost).
cost([A1,A2|T], Cost, Cost_Acc) :- connected(A1, A2, Val), Cost_Acc_Updated is Cost_Acc + Val, 
								   cost([A2|T], Cost, Cost_Acc_Updated).   


show_path(X,Y,R):-show_path(X,Y,[],R).

show_path(X,Y,_,[X,Y]) :- connected(X,Y, Val).
show_path(X,Y,L,[X|R]) :- connected(X,Z, Val), \+member(L, Z),
                          show_path(Z,Y,[Z|L],R).

findpath(Start, End, Path, Sum) :- show_path(Start, End, Path), not(has_duplicate(Path)), cost(Path, Sum, 0).
