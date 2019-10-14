:-style_check(-singleton).
:- ['../Utils.pl'].
:- ['Sublist.pl'].

% ############################################################################################

% len/2 evaluates the length of a given list.
len([], 0).

len([_|T], N) :-

			% One element of the list is taken and eliminated at a time.
			len(T, X), 
			% At the same time, this element is accounted for by the following clause.
			N is X+1.

% ############################################################################################

% remove_nth/3 removes the nth element of 'X' and stores the resultant list in 'Y'.

remove_nth(N, X, Y) :-

			% 'L' is the length of the list 'X'.
			len(X, L), 

			% Length of the list has to be greater than N for this predicate to evaluate to true.
			L>=N, 
			N1 is N-1, 
			N2 is L - N,

			% 'SubList1' is the part of the list that comes before the nth element.
			prefix(SubList1, X), 
			len(SubList1, N1),

			% 'SubList2' is the part of the list that comes after the nth element.
			suffix(SubList2, X), 
			len(SubList2, N2),

			% The final result is obtained by appending 'SubList2' to 'SubList1'.
			append(SubList1, SubList2, Y).

% ################################################################################################