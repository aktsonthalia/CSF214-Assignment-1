
:-style_check(-singleton).

% Importing Utility Predicates
:- ['../Utils.pl'].

% ########################################################################		

% prefix/2 checks if the first argument is prefix of the second argument.

% An empty list is a prefix of every list.
prefix(X, Y) :- append_(X, _, Y).		
% ########################################################################			

reverse([], []).
reverse([H|T], L2) :- 
		reverse(T, L3),
		append_(L3, [H], L2).
		
% ########################################################################		

suffix(X, Y) :- append_(_, X, Y).

% #########################################################################			

sublist(X, Y) :- 

		suffix(Suffix, Y),
		prefix(X, Suffix);

		write('false.').
		
% #########################################################################			
