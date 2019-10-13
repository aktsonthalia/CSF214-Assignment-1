<pre>
?- remove_nth(3, [1, 2, 3, 4, 5, 6], Y).
Y = [1, 2, 4, 5, 6].
</pre>

<pre>
?- remove_nth(7, [1, 2, 3, 4], Y).
false.
</pre>

<pre>
?- remove_nth(7, [a, b, c, d, 1, 2, 3, 4], Y).
Y = [a, b, c, d, 1, 2, 4].
</pre>

<pre>
?- remove_nth(7, [], Y).
false.
</pre>
