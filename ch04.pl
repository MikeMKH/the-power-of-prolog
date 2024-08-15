:- use_module(library(clpfd)).

:- begin_tests(ch04).

:- set_prolog_flag(double_quotes, chars).

test(strings_are_list) :-
  assertion(['h','e','l','l','o',' ','w','o','r','l','d'] = "hello world"),
  assertion("hello world" = ['h','e','l','l','o',' ','w','o','r','l','d']).

:- end_tests(ch04).
:- run_tests.