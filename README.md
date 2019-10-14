# Prolog-Assignment

remaining : 

test cases for
  findpath
  
<h1> Instructions on Running and Testing the Code in this Project </h1>

<h2> Requirements </h2>

A working installation of <a href="https://www.swi-prolog.org/">SWI-Prolog</a> is needed to successfully execute the code in this project. 

<h2> Find Path </h2>

Idhar daal dena find path ke test cases.

<h2> Sublist </h2>
<pre>
?- sublist([a, c], [a, b, c]).
false.
</pre>

<pre>
?- sublist([a], [a, b, c]).
true.
</pre>

<pre>
?- sublist([2, 3], [1, 2, 3, 4, 5]).
true.
</pre>

<h2> Has Triplicate </h2>
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

<h2> Remove Nth </h2>
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

<h2> Remove Every Other </h2>

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
