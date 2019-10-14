<h1> Logic in Computer Science (CS F214)</h1>
<h3> Assignment 1 <h3>

  - Ankit Sonthalia (2017B4A70468P)  
  - Rahil N Jain (2017B4A70541P)
  - Nayan Khanna (2017B4A70636P)
<br>
  
<h2> Instructions on Running and Testing the Code in this Project </h2>

<h3> Requirements </h3>

A working installation of <a href="https://www.swi-prolog.org/">SWI-Prolog</a> is needed to successfully execute the code in this project.  
The command <code>prolog</code> or <code>swipl</code> accomplishes the same in most Linux distributions.  
If Prolog has been installed properly, either of these commands will produce the following output.
<pre>
Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit http://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- </pre>

<h2> Step-Wise Instructions </h2>

  - After unzipping the <code> .zip </code> file, open a terminal and navigate to the directory containing this README.
  - Some of the predicates in the subsequent directories draw dependencies from <code>Utils.pl</code>, and are required to reference  
  the same using its current location.  
  Therefore, please take special care to not make any changes to the existing directory structure.
  - For running the functions, type the following into the terminal and press enter.
  <pre>prolog driver.pl</pre>
  - If there are no errors, the following output will be produced.
  <pre>
  All Predicates imported Successfully!
  Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
  SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
  Please run ?- license. for legal details.

  For online help and background, visit http://www.swi-prolog.org
  For built-in help, use ?- help(Topic). or ?- apropos(Word).

  ?- </pre>

  Any of the predicates in either of the directories <code>**Question1**</code> and <code>**Question 2**</code>, or in <code>**Utils.pl**</code>   
  can now be invoked by using appropriate format.
    
<h2> Precautionary Note </h2>

In Prolog, anything of the form <code>foo(A, B, C)</code> is a <strong>predicate</strong>. Given values of A, B, & C, it checks if A, B and C  
satisfy the constraints specific to this particular predicate and returns <code>true</code> if they do; otherwise, it returns <code>false</code>.  
In case one or more of these values is not supplied, it tries to satisfy the constraints anyway by puttting in   
different values to replace the variables.  

Hence, when we say a particular predicate _evaluates_ something, what we really mean is that given a set of variables   
out of which one of more do not have preset values, it tries to assign values to these unknown variables so as to    
satisfy the given constraints. The test cases described in the later half of this README.md bear this very important  
fact in the background.

The rest of this file contains working test cases for each of the files, and further guidelines wherever needed.

<h2> Find_Path </h2>

find_path/4 checks if there is a path between Vertex 1 (the first argument) and Vertex 2 (the second argument) and stores  
the same in Path (the third argument). It stores the corresponding sum of costs of all the edges inside the path in the  
variable Sum. On each press of the **semicolon (;)**, it prints out alternate paths. After exhausting all such alternate  
paths, it prints out <code>false</code> and terminates.

<h3> Test Cases </h3>

<h5> TEST CASE 1 </h5>
Lists all paths between <code>a</code> and <code>b</code> with appropriate weights.  
<pre>
?- find_path(a, b, Path, Sum).
Path = [a, b],
Sum = 5 ;
Path = [a, c, b],
Sum = 10 ;
Path = [a, c, d, b],
Sum = 261 ;
Path = [a, c, e, f, d, b],
Sum = 1509 ;
Path = [a, c, e, d, b],
Sum = 1212 ;
Path = [a, d, b],
Sum = 256 ;
Path = [a, d, e, c, b],
Sum = 966 ;
Path = [a, d, f, e, c, b],
Sum = 1263 ;
Path = [a, d, c, b],
Sum = 15 ;
Path = [a, g, f, e, d, b],
Sum = 403 ;
Path = [a, g, f, e, d, c, b],
Sum = 162 ;
Path = [a, g, f, e, c, b],
Sum = 1103 ;
Path = [a, g, f, e, c, d, b],
Sum = 1354 ;
Path = [a, g, f, d, b],
Sum = 598 ;
Path = [a, g, f, d, e, c, b],
Sum = 1308 ;
Path = [a, g, f, d, c, b],
Sum = 357 ;
false.
</pre>

<h5> TEST CASE 2 </h5>
There exists only one path between <code>a</code> and <code>a</code>, which is <code>[a]</code> itself with weight <code>0</code>.  
<pre>
?- find_path(a, a, Path, Sum).
Path = [a],
Sum = 0 ;
false.
</pre>

<h5> TEST CASE 3 </h5>
There exists no path between <code>a</code> and <code>i</code> and hence evaluates to <code>false</code>.  
<pre>
?- find_path(a, i, Path, Sum).
false.
</pre>


<h2> Sublist.pl </h2>

sublist/2 stores if the list X (first argument) is a sublist of the list Y (the second argument). If yes, it returns <code>true</code>, otherwise <code>false</code>.

<h3> Test Cases </h3> 

<h5> TEST CASE 1 </h5>
<code>[1, 2]</code> is a sublist of <code>[1, 2, 3, 4, 5]</code>.  
<pre>
?- sublist([1, 2], [1, 2, 3, 4, 5]).
true .
</pre>

<h5> TEST CASE 2 </h5>
<code>[1, 4]</code> is not a sublist of <code>[1, 2, 3, 4, 5]</code>.  
<pre>
?- sublist([1, 4], [1, 2, 3, 4, 5]).
false.
</pre>

<h5> TEST CASE 3 </h5>
<code>[]</code> is a sublist of every list including itself.  
<pre>
?- sublist([], [1, 2, 3, 4, 5]).
true .
?- sublist([], []).
true .
</pre>

<h2> Has_Triplicate.pl </h2>

has_triplicate/1 returns <code>true</code> if the given list has three or more than three occurences of an element.  
Further, it prints out the corresponding element. On each press of a **semicolon**, alternate such elements are printed  
out. Once no such element remains, the program prints out <code>false</code> and terminates.

<h3> Test Cases </h3>

<h5> TEST CASE 1 </h5>
<pre>
?- has_triplicate([1, 1, 2, 3, 3, 2, 1, 2, 4]).
1
true ;
2
true ;
false.
</pre>

<h5> TEST CASE 2 </h5>
<pre>
?- has_triplicate([a, b, c, d, e, a, b, c, f, e, a, f]).
a
true ;
false.
</pre>

<h5> TEST CASE 3 </h5>
<pre>
?- has_triplicate([]).
false.
</pre>Nayan Khanna (2017B4A70636P)


<h2> Remove_nth.pl </h2>

remove_nth/3 creates a list Y (the third argument), which is the list X (second argument), with its Nth element  
removed. The number 'N'(first argument) is supplied by the user at run time. If an Nth element does not exist  
for the given list, the program returns <code>false</code> and terminates.

<h3> Test Cases </h3>
<h5> TEST CASE 1 </h5>
For valid <code>n</code>, the predicate works as expected.   
<pre>
?- remove_nth(3, [1, 2, 3, 4, 5, 6], Y).
Y = [1, 2, 4, 5, 6].
</pre>

<h5> TEST CASE 2 </h5>
For invalid <code>n</code>, the predicate fails.   
<pre>
?- remove_nth(7, [1, 2, 3, 4], Y).
false.
</pre>

<h5> TEST CASE 3 </h5>
An attempt to remove an element from an empty list fails.  
<pre>
?- remove_nth(7, [], Y).
false.
</pre>


<h2> Remove_every_other.pl </h2>

remove_every_other/2 removes every even-indexed element from the list X(first argument) and puts the resultant  
element in the list Y (second argument). The first element is always retained. Indexing starts at 1.

<h3> Test Cases </h3>

<h5> TEST CASE 1 </h5>
In the following two test cases, the predicate removes elements at <code>even</code> positions.  
<pre>
?- remove_every_other([1, 2, 3, 4, 5, 6, 7], Y).
Y = [1, 3, 5, 7] .
?- remove_every_other([a, b, c, d, e, f], Y).
Y = [a, c, e].
</pre>

<h5> TEST CASE 2 </h5>
No element is removed from a singleton list.  
<pre>
?- remove_every_other([a], Y).
Y = [a]
</pre>

<h5> TEST CASE 3 </h5>
No element is removed from an empty list.
<pre>
?- remove_every_other([], Y).
Y = [].
</pre>
