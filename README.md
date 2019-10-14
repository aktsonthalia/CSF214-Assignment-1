# Prolog-Assignment

remaining : 

test cases for
  findpath
  
<h1> Instructions on Running and Testing the Code in this Project </h1>

<h2> Requirements </h2>

A working installation of <a href="https://www.swi-prolog.org/">SWI-Prolog</a> is needed to successfully execute the code in this project. 

<h2> Step-Wise Instructions </h2>

  - After unzipping the ` .zip ` file, open a terminal and navigate to the directory containing this README.md file,   
  i.e., navigate to the same directory level as this file.
  - Some of the predicates in the subsequent directories draw dependencies from `Utils.pl`, and are required to reference  
  the same using its current location.  
  Therefore, please take special care to not make any changes to the existing directory structure.
  - After completing `Step 1`, start Prolog in the terminal. The command `prolog` accomplishes the same in most  
  Linux  distributions.
  - For executing the code for Question 1, type the following and press `Enter`.
    <pre>`consult('Question 1/Find_path.pl').</pre> 
  - Similarly, for executing the code for Question 2, type the following into the Prolog terminal, depending on which  
  of the four subparts of the question you wish to view.
    <pre>consult('Question 2/Sublist.pl').</pre>
    <pre>consult('Question 2/Has_triplicate.pl').</pre>
    <pre>consult('Question 2/Remove_nth.pl').</pre>
    <pre>consult('Question 2/Remove_every_other.pl').</pre>
  Once a particular .pl file is loaded, all of its predicates can be evaluated for different inputs by typing them into  
  the terminal.
    
  

<h2> Precautionary Note </h2>

In Prolog, anything of the form <code>foo(A, B, C)</code> is a <strong>predicate</strong>. Given values of A, B, & C,   
it checks if A, B and C satisfy the constraints specific to this particular predicate and returns <code>true</code>    
if they do; otherwise, it returns <code>false</code>. In case one or more of these values is not supplied, it tries   
to satisfy the constraints anyway by puttting in different values to replace the variables.  

Hence, when we say a particular predicate _evaluates_ something, what we really mean is that given a set of variables   
out of which one of more do not have preset values, it tries to assign values to these unknownn variables so as to    
satisfy the given constraints. The test cases described in the later half of this README.md bear this very important  
fact in the background.

The rest of this file contains working test cases for each of the files, and further guidelines wherever needed.

<h2> Find_Path </h2>

find_path/4 checks if there is a path between Vertex 1 (the first argument) and Vertex 2 (the second argument) and stores  
the same in Path (the third argument). It stores the corresponding sum of costs of all the edges inside the path in the  
variable Sum. On each press of the semicolon (;), it prints out alternate paths. After exhausting all such alternate  
paths, it prints out 'false' and terminates.

<h3> Test Cases </h3>

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

<pre>
?- find_path(a, a, Path, Sum).
Path = [a],
Sum = 0 ;
false.
</pre>

<pre>
?- find_path(c, g, Path, Sum).
Path = [c, d, e, f, g],
Sum = 132 ;
Path = [c, d, f, g],
Sum = 327 ;
Path = [c, d, a, g],
Sum = 35 ;
Path = [c, d, b, a, g],
Sum = 286 ;
Path = [c, e, f, g],
Sum = 1073 ;
Path = [c, e, f, d, a, g],
Sum = 1283 ;
Path = [c, e, f, d, b, a, g],
Sum = 1534 ;
Path = [c, e, d, f, g],
Sum = 1278 ;
Path = [c, e, d, a, g],
Sum = 986 ;
Path = [c, e, d, b, a, g],
Sum = 1237 ;
Path = [c, b, d, e, f, g],
Sum = 383 ;
Path = [c, b, d, f, g],
Sum = 578 ;
Path = [c, b, d, a, g],
Sum = 286 ;
Path = [c, b, a, g],
Sum = 35 ;
Path = [c, b, a, d, e, f, g],
Sum = 142 ;
Path = [c, b, a, d, f, g],
Sum = 337 ;
Path = [c, a, g],
Sum = 30 ;
Path = [c, a, b, d, e, f, g],
Sum = 388 ;
Path = [c, a, b, d, f, g],
Sum = 583 ;
Path = [c, a, d, e, f, g],
Sum = 137 ;
Path = [c, a, d, f, g],
Sum = 332 ;
false.
</pre>


<h2> Sublist.pl </h2>

sublist/2 stores if the list X (first argument) is a sublist of the list Y (the second argument). If yes, it returns <code>true</code>, otherwise <code>false</code>.

<h3 Test Cases </h3>

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

<h2> Has_Triplicate.pl </h2>

has_triplicate/1 returns <code>true</code> if the given list has three or more than three occurences of an element.  
Further, it prints out the corresponding element. On each press of a semicolon, alternate such elements are printed  
out. Once no such element remains, the program prints out <code>false</code> and terminates.

<h3> Test Cases </h3>

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

<h2> Remove_Nth.pl </h2>

remove_nth/3 creates a list Y (the third argument), which is the list X (second argument), with its Nth element  
removed. The number 'N'(first argument) is supplied by the user at run time. If an Nth element does not exist  
for the given list, the program returns <code>false</code> and terminates.

<h3> Test Cases </h3>
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


<h2> Remove_every_other.pl </h2>

remove_every_other/2 removes every even-indexed element from the list X(first argument) and puts the resultant  
element in the list Y (second argument). The first element is always retained. Indexing starts at 1.

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
