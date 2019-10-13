:-style_check(-singleton).
:- ['../Utils.pl'].

has_triplicate([]) :- false.
has_triplicate(X) :- remove_duplicates(X, [], X_without_repitition), 
					 member(X_without_repitition, Element), occurences(X, Element, 0, N), N >= 3, write(Element).
