weight(a,b,10).
weight(b,c,1).
weight(a,c,15).
weight(c,d,0).
weight(d,e,20).
weight(e,f,12).
weight(f,g,30).
weight(g,h,5).
weight(a,a,5).
weight(b,b,5).
weight(c,c,5).
weight(d,d,5).
edge(a,b).
edge(b,c).
edge(a,c).
edge(c,d).
edge(d,e).
edge(e,f).
edge(f,g).
edge(g,h).


'final code'.

findpath(X,X,[X],0).
findpath(X,Y,[X|Line],N):- 

    weight(X,Z,WE) ,
    % not(member(X,_|Line)),
    (
        Y is Z;
        findpath(Z,Y,Line,L)
    ),
    N is L+WE
    .


'end of final code'.







