% :- use_module(library(tabling)). % Warning:    :- table/1 is built-in.  library(tabling) is deprecated.

:- table adjacent/2.
adjacent(a, b).
adjacent(e, f).
adjacent(X, Y) :- adjacent(Y, X).

% ?- adjacent(X, Y), false.
% false.
