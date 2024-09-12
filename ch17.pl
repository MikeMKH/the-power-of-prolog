:- set_prolog_flag(double_quotes, codes).
:- use_module(library(clpfd)).

add(I0, N, I) :- I #= I0 + N.

% ?- add(1,2,R).
% R = 3.

% ?- add(1,R,3).
% R = 2.

% ?- add(X,Y,3).
% X+Y#=3.

list1_element_list2([], _, []).
list1_element_list2([E|Ls1], E, Ls2) :-
  list1_element_list2(Ls1, E, Ls2).
list1_element_list2([L|Ls1], E, [L|Ls2]) :-
  dif(L, E),
  list1_element_list2(Ls1, E, Ls2).

% ?- list1_element_list2([1,2,3], 2, R).
% R = [1, 3] ;
% false.

% ?- list1_element_list2([1,2,3], X, [1,2]).
% X = 3 ;
% false.

% ?- list1_element_list2(Xs, 5, [1,2]).
% ERROR: Stack limit (1.0Gb) exceeded
% ERROR:   Stack sizes: local: 0.8Gb, global: 0.1Gb, trail: 39.4Mb
% ERROR:   Stack depth: 5,160,076, last-call: 0%, Choice points: 5,160,068
% ERROR:   Possible non-terminating recursion:
% ERROR:     [5,160,076] user:list1_element_list2(_31021948, 5, [length:2])
% ERROR:     [5,160,075] user:list1_element_list2([length:1|_31021986], 5, [length:2])
%    Exception: (5,156,811) list1_element_list2(_31002292, 5, [1, 2]) ? abort
% % Execution Aborted

% ?- get_string_code(1, "c", C), list1_element_list2("abc", C, Codes), string_codes(R, Codes).
% C = 99,
% Codes = [97, 98],
% R = "ab" ;
% false.