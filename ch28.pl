% :- use_module(library(tabling)). % Warning:    :- table/1 is built-in.  library(tabling) is deprecated.
:- use_module(library(clpfd)).

:- table adjacent/2.
adjacent(a, b).
adjacent(e, f).
adjacent(X, Y) :- adjacent(Y, X).

% ?- adjacent(X, Y), false.
% false.

:- table fibonacci/2.
fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, F) :-
  N #> 1,
  N1 #= N-1,
  N2 #= N-2,
  fibonacci(N1, F1),
  fibonacci(N2, F2),
  F #= F1 + F2.

% ?- fibonacci(100,F).
% F = 573147844013817084101.