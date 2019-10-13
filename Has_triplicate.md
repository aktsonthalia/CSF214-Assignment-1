<pre>
?- has_triplicate([1, 1, 2, 3, 4, 1, 2, 3, 4, 5, 6, 2, 3]).
1
true ;
2
true ;
3
true ;
false.
</pre>

<pre>
?- has_triplicate([a, b, c, d, e, a, b, c, f, e, a, f]).
a
true ;
false.
</pre>

<pre>
?- has_triplicate([]).
false.
</pre>
