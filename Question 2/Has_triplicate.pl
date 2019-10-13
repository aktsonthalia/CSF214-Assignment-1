:-style_check(-singleton).
:- ['../Utils.pl'].

% ###################################################################

% has_triplicate/1 finds all elements that occur three or more times in the given list.

has_triplicate([]) :- false.

has_triplicate(X) :- 
					 % removes duplicates from 'X' and stores the resultant list in 'X_without_repitition'.
					 % This predicate ensures that no element is printed multiple times.
					 remove_duplicates(X, [], X_without_repitition), 

					 % 'Element' is a member of 'X_without_repitition'. 
					 member(X_without_repitition, Element), 

					 % 'N' is the number of times 'Element' occurs in 'X'.
					 occurences(X, Element, 0, N), 

					 % For 'Element' to be a triplicate, the following condition has to hold.
					 N >= 3, 

					 write(Element).
					 
% ###################################################################
