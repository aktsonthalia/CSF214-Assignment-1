weight(a,b,10).
weight(b,c,1).
weight(c,d,0).
weight(d,e,20).
weight(e,f,12).
weight(f,g,30).
weight(g,h,5).
'weight(a,a,50).
weight(b,b,60).'.
edge(a,b).
edge(b,c).
edge(c,d).
edge(d,e).
edge(e,f).
edge(f,g).
edge(g,h).


"final code"

findpath(X,X,[X],0).
findpath(X,Y,[X|Line],N):- 

    weight(X,Z,WE),
    (
        Y=X
        ;
        findpath(Z,Y,Line,L)
    )
    ,
    N is L+WE
    .




"end of final code"







append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3). 
last(Path,Last).   
path(A,B) :-   % two nodes are connected, 'if'
  walk(A,B,[]) % - 'if' we can walk from one to the other,
  .            % first seeding the visited list with the empty list

walk(A,B,V) :-       % we can walk from A to B...
  edge(A,X) ,        % - 'if' A is connected to X, and
  not(member(X,V)) , % - we havent yet visited X, and
  (                  % - either
    B = X            %   - X is the desired destination
  ;                  %   OR
    walk(X,B,[A|V])  %   - we can get to it from X
  )                  %
  .                  % Easy!
