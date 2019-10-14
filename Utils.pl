
:-style_check(-singleton).

% ####################################################################################################################

% An empty list has no elements.
member([], Element) :- false.

% If 'Element' does not match with 'Head', the rest of the list is checked with a recursive call. 
% The process continues until either 'Element' is found, or the list is reduced to an empty one.
member([Head|Tail], Element) :- 
			Element = Head;
			member(Tail, Element).

% ####################################################################################################################			

% remove/4 removes all occurrences of 'Element' from the given list.

% Once the original list is empty, the accumulator is stored in the result.
remove([], Element, Updated_List, Updated_List).

% The accumulator 'Updated_List' stores every element that is not 'Element' at each recursive call.
remove([H|T], Element, Updated_List, Res) :- 
			(append(Updated_List, [H], Updated_List_New), not(H = Element);
            append(Updated_List, [], Updated_List_New), H = Element), 
            remove(T, Element, Updated_List_New, Res).

% ####################################################################################################################			

% occurences/4 counts the number of occurences of 'Element' in the given list.

% Once the original list is empty, the accumulator is stored in the result.
occurences([], Element, N, N).

% The accumulator 'N' gets incremented by 1 each time 'Element' is encountered.
occurences([H|T], Element, N, Res) :- 
			((N_updated is N+1, 
			 H = Element) ; 
			 N_updated is N, 
			 not(H = Element)), 
			 occurences(T, Element, N_updated, Res).

% ####################################################################################################################			

% append/3 appends 

append([], L, L).
append([H|T], L, Res) :- 
			append(T, L, Res2), 
			Res = [H|Res2].

% ####################################################################################################################			

% remove_duplicates/3 removes all repeated occurences of element(s) from a list.

remove_duplicates([], Y, Y).
remove_duplicates([H|T], Y, Res) :- 
			append(Y, [H], Y_updated), 
			remove([H|T], H, [], X_updated), 
			remove_duplicates(X_updated, Y_updated, Res).

% ####################################################################################################################			
