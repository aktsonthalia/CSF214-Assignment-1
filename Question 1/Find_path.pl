% Question 1

:-style_check(-singleton).

% Importing Utility Predicates
:- ['../Utils.pl'].
:- ['Sample Graphs/graph1.pl'].

% ##############################################

% Since this is an undirected graph, the edge predicate checks if two vertices are connected, regardless of the order 
% in which the weight predicate has been defined for them.
% Returns true if an edge exists; otherwise, it returns 'false'.

edge(Vertex_1, Vertex_2, Distance) :- 
				weight(Vertex_1, Vertex_2, Distance); 
				weight(Vertex_2, Vertex_1, Distance).

% ##############################################

% Checks if the given list 'X' has a repeated element.
% Returns true if such an element exists; otherwise, it returns 'false'.

% An empty list has no duplicates, hence the following predicate returns 'false'.
has_duplicate([]):- false.

has_duplicate(X) :- 
				% 'X_without_repitition' is the set consisting of all elements of 'X'.
				remove_duplicates(X, [], X_without_repitition), 

				% 'X_without_repitition' contains 'Element'.
				member(X_without_repitition, Element), 

				% 'N' is the number of occurences of 'Element' in 'X'.
				occurences(X, Element, 0, N),
				
				% 'has_duplicate/1' evaluates to 'true' only if the following condition holds. 
				N >= 2.

% ##############################################

% cost(Path, Cost, []) takes the accumulator [] and evaluates the cost of 'Path', which it finally stores in 'Cost'.
% Cost of a path is defined as the sum of weights of edges between all consecutive pairs of vertices contained in 'Path'.

% Recursion ends when the list is either empty or is reduced to a singleton list.
cost([], Cost, Cost).
cost([H], Cost, Cost).

% Recursively computes weights between any two given vertices and adds them to the accumulator 'Cost_Acc'.
cost([Vertex_1, Vertex_2|T], Cost, Cost_Acc) :- 

				% 'Weight' is the distance between 'Vertex1' and 'Vertex2'. 
				edge(Vertex_1, Vertex_2, Weight),

				% 'Cost_Acc' is updated to accomodate the new 'Weight'
				Cost_Acc_Updated is Cost_Acc + Weight, 

				% Recursive call to traverse further down the path.
				cost([Vertex_2|T], Cost, Cost_Acc_Updated).   

% ##############################################

% A naive approach to finding all possible paths between two given vertices.
% find_path_naive/3 considers all paths, including ones that contain cycles.

find_path_naive(Vertex_1, Vertex_2, Path) :-
				find_path_naive(Vertex_1, Vertex_2, [], Path).

find_path_naive(Vertex_1, Vertex_2, _, [Vertex_1,Vertex_2]) :- 
				edge(Vertex_1, Vertex_2, Val).

find_path_naive(Vertex_1, Vertex_2, L, [Vertex_1|Path]) :- 
				edge(Vertex_1, Vertex_3, Val), 
				\+member(L, Vertex_3),
				find_path_naive(Vertex_3, Vertex_2, [Vertex_3|L],Path).

% ##############################################
% find_path/4 improves upon find_path_naive/3 by eliminating all cycles. 

% If the beginning and end points are one and the same, then the path is a singleton list and its cost is 0.
find_path(Start, Start, [Start], 0).

find_path(Start, End, Path, Sum) :- 

				% 'Path' is any arbitrary valid path between 'Start' and 'End'.
				find_path_naive(Start, End, Path), 

				% This predicate ensures that 'Path' contains no cycles.
				not(has_duplicate(Path)), 

				% 'Sum' is the total distance covered by 'Path'.
				cost(Path, Sum, 0).

% ##############################################
