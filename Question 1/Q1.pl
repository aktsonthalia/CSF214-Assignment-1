weight(a,b,10).
weight(b,c,1).
weight(c,d,0).
weight(d,e,20).
weight(e,f,12).
weight(f,g,30).
weight(g,h,5).
weight(a,a,50).
weight(b,b,60).
edge(a,b).
edge(b,c).
edge(c,d).
edge(d,e).
edge(e,f).
edge(f,g).
edge(g,h).
edge(b,b).
edge(a,a).
findpath(X,Y,[X],0).
findpath(X,Y,[Path|Z],L):- edge(Last|Z),findpath(X,Y,Path,L).
append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3). 
last(Path,Last).   