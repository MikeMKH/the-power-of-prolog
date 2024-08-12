:- use_module(library(clpfd)).

:- begin_tests(ch01).

% from https://www.metalevel.at/prolog/facets
list_length([], 0).
list_length([_|Ls], N) :-
  N #> 0,
  N #= N0 + 1,
  list_length(Ls, N0).

test(list_length_empty) :-
  list_length([], N),
  assertion(N =:= 0).

test(list_length_1) :-
  list_length([1], N),
  assertion(N =:= 1).

test(list_length_2) :-
  list_length([1,2], N),
  assertion(N =:= 2).

test(list_length_3) :-
  list_length(["a","b","c"], N),
  assertion(N =:= 3).

test(list_length_hello_world) :-
  string_chars("hello world", Ls),
  list_length(Ls, N),
  assertion(N =:= 11).

:- end_tests(ch01).
:- run_tests.