:-style_check(-singleton).
:- ['../Utils.pl'].

% #################################################################################

% remove_every_other/2 removes elements at even positions from the given list

% Empty list : nothing to remove.
remove_every_other([], []).

% Singleton list : no odd position element to remove.
remove_every_other([H], [H]).

% Considers two elements 'H' and '_' at a time : 
% 'H' is retained while '_' is removed.

remove_every_other([H,_|T1], [H|T2]) :- remove_every_other(T1, T2).

% #################################################################################
