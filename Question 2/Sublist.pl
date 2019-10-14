
:-style_check(-singleton).
% ###########################			

% prefix/2 checks if the first argument is prefix of the second argument.

% An empty list is a prefix of every list.
prefix(X, Y) :- append(X, _, Y).	
	
% ###########################					

suffix(X, Y) :- 
	append(_, X, Y).

% ###########################	

sublist(X, Y) :-
    append([_, X, _], Y).
		
% ###########################
