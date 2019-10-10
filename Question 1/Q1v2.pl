%weight(+Start, +End, -Weight)
weight(a,b,5).
weight(b,c,5).
weight(c,d,5).
weight(d,e,5).
weight(e,f,51).
weight(f,g,71).
weight(a,c,5).
weight(a,d,5).
weight(b,d,251).
weight(c,e,951).
weight(d,f,251).
weight(g,a,025).
weight(h,a,715).

weight2(X,Y,D) :- weight(X,Y,D).
weight2(X,Y,D) :- weight(Y,X,D).

edge(Current, Next, E,Path) :-
    weight2(Current, Next, E),
    not(member(Next, _|Path)).


findpath(End, End, [End], 0).
findpath(Start, End, [Start|Path] , Sum) :-
    edge(Start,Inter,Val,Path),write(Inter),
    
    findpath(Inter, End, Path, Buf),Sum is Val+Buf.