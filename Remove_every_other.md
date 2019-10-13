<pre>
?- remove_every_other([1, 2, 3, 4, 5, 6, 7], Y).
Y = [1, 3, 5, 7] .
</pre>

<pre>
?- remove_every_other([a, b, c, d, e, f], Y).
Y = [a, c, e].
</pre>

<pre>
?- remove_every_other([a], Y).
Y = [a]
</pre>

<pre>
?- remove_every_other([], Y).
Y = [].
</pre>
