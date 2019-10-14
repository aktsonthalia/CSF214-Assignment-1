<h1> Logic in Computer Science (CS F214)</h1>
<h3> Assignment 1 <h3>

  - Ankit Sonthalia (2017B4A70468P)  
  - Rahil N Jain (2017B4A70541P)   
  - Nayan Khanna (2017B4A70636P)  

  
<h2> Instructions on Running and Testing the Code in this Project </h2>

<h3> Requirements </h3>

A working installation of <a href="https://www.swi-prolog.org/">SWI-Prolog</a> is needed to successfully execute the code in this project. 

<h2> Step-Wise Instructions </h2>

  - After unzipping the <code> .zip </code> file, open a terminal and navigate to the directory containing this README.md file.
  ############ ISKO THEEEEEK KARO MADARCHOD
  - Some of the predicates in the subsequent directories draw dependencies from <code>Utils.pl</code>, and are required to reference  
  the same using its current location.  
  Therefore, please take special care to not make any changes to the existing directory structure.
  - After completing <code>Step 1</code>, start Prolog in the terminal. The command <code>prolog</code> or <code>swipl</code> accomplishes the same in most  
  Linux  distributions.
  - For running the functions, type the following in the terminal and press enter.
  <pre>prolog driver.pl</pre>
  - You should see the line __All Predicates imported Successfully!__ just like below:
  <pre>
  All Predicates imported Successfully!
  Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
  SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
  Please run ?- license. for legal details.

  For online help and background, visit http://www.swi-prolog.org
  For built-in help, use ?- help(Topic). or ?- apropos(Word).

  ?- </pre>
  Once a particular .pl file is loaded, all of its predicates can be evaluated for different inputs by typing them into  
  the terminal.
    
<h2> Precautionary Note </h2>

In Prolog, anything of the form <code>foo(A, B, C)</code> is a <strong>predicate</strong>. Given values of A, B, & C, it checks  
if A, B and C satisfy the constraints specific to this particular predicate and returns <code>true</code>      
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
<pre>
?- sublist([a, c], [a, b, c]).
false.
</pre>

<h5> TEST CASE 2 </h5>
<pre>
?- sublist([a], [a, b, c]).
true.
</pre>

<h5> TEST CASE 3 </h5>
<pre>
?- sublist([2, 3], [1, 2, 3, 4, 5]).
true.
</pre>

<h2> Has_Triplicate.pl </h2>

has_triplicate/1 returns <code>true</code> if the given list has three or more than three occurences of an element.  
Further, it prints out the corresponding element. On each press of a semicolon, alternate such elements are printed  
out. Once no such element remains, the program prints out <code>false</code> and terminates.

<h3> Test Cases </h3>

<h5> TEST CASE 1 </h5>
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
</pre>

<h2> Remove_Nth.pl </h2>

remove_nth/3 creates a list Y (the third argument), which is the list X (second argument), with its Nth element  
removed. The number 'N'(first argument) is supplied by the user at run time. If an Nth element does not exist  
for the given list, the program returns <code>false</code> and terminates.

<h3> Test Cases </h3>
<h5> TEST CASE 1 </h5>
<pre>
?- remove_nth(3, [1, 2, 3, 4, 5, 6], Y).
Y = [1, 2, 4, 5, 6].
</pre>

<h5> TEST CASE 2 </h5>
<pre>
?- remove_nth(7, [1, 2, 3, 4], Y).
false.
</pre>

<h5> TEST CASE 3 </h5>
<pre>
?- remove_nth(7, [a, b, c, d, 1, 2, 3, 4], Y).
Y = [a, b, c, d, 1, 2, 4].
</pre>

<h5> TEST CASE 4 </h5>
<pre>
?- remove_nth(7, [], Y).
false.
</pre>


<h2> Remove_every_other.pl </h2>

remove_every_other/2 removes every even-indexed element from the list X(first argument) and puts the resultant  
element in the list Y (second argument). The first element is always retained. Indexing starts at 1.

<h3> Test Cases </h3>

<h5> TEST CASE 1 </h5>
<pre>
?- remove_every_other([1, 2, 3, 4, 5, 6, 7], Y).
Y = [1, 3, 5, 7] .
</pre>

<h5> TEST CASE 2 </h5>
<pre>
?- remove_every_other([a, b, c, d, e, f], Y).
Y = [a, c, e].
</pre>

<h5> TEST CASE 3 </h5>
<pre>
?- remove_every_other([a], Y).
Y = [a]
</pre>

<h5> TEST CASE 4 </h5>
<pre>
?- remove_every_other([], Y).
Y = [].
</pre>
