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

jug_capacity(a, 8).
jug_capacity(b, 5).
jug_capacity(c, 3).

moves(Jugs) -->
% goal a = 4, b = 4
  { member(jug(a,4), Jugs),
    member(jug(b,4), Jugs) }.
moves(Jugs0) --> [from_to(From,To)],
  { select(jug(From,FromFill0), Jugs0, Jugs1),
    FromFill0 #> 0,
    select(jug(To,ToFill0), Jugs1, Jugs),
    jug_capacity(To, ToCapacity),
    ToFill0 #< ToCapacity,
    Move #= min(FromFill0, ToCapacity-ToFill0),
    FromFill #= FromFill0 - Move,
    ToFill #= ToFill0 + Move },
  moves([jug(From,FromFill),jug(To,ToFill)|Jugs]).

% ?- length(Ms, _), phrase(moves([jug(a,8),jug(b,0),jug(c,0)]), Ms).
% Ms = [from_to(a, b), from_to(b, c), from_to(c, a), from_to(b, c), from_to(a, b), from_to(b, c), from_to(c, a)] ;
% Ms = [from_to(a, c), from_to(c, b), from_to(a, c), from_to(c, b), from_to(b, a), from_to(c, b), from_to(a, c), from_to(c, b)] ;
% Ms = [from_to(a, b), from_to(a, c), from_to(c, a), from_to(b, c), from_to(c, a), from_to(b, c), from_to(a, b), from_to(b, c), from_to(..., ...)] .

% ?- length(Ms, _), phrase(moves([jug(a,4),jug(b,4),jug(c,0)]), Ms).
% Ms = [] ;
% Ms = [from_to(a, c), from_to(c, a)] ;
% Ms = [from_to(b, c), from_to(c, b)] ;
% Ms = [from_to(a, c), from_to(c, a), from_to(a, c), from_to(c, a)] ;
% Ms = [from_to(a, c), from_to(c, a), from_to(b, c), from_to(c, b)] ;
% Ms = [from_to(a, c), from_to(c, b), from_to(b, c), from_to(c, a)] ;
% Ms = [from_to(b, c), from_to(c, b), from_to(b, c), from_to(c, b)] ;
% Ms = [from_to(b, c), from_to(c, b), from_to(a, c), from_to(c, a)] ;
% Ms = [from_to(b, c), from_to(c, a), from_to(a, c), from_to(c, b)] ;
% Ms = [from_to(a, c), from_to(c, a), from_to(a, c), from_to(c, a), from_to(a, c), from_to(c, a)] .

% ?- length(Ms, _), phrase(moves([jug(a,1),jug(b,5),jug(c,3)]), Ms).
% ^CAction (h for help) ? abort
% % Execution Aborted
% ?- length(Ms, _), phrase(moves([jug(a,0),jug(b,5),jug(c,3)]), Ms).
% Ms = [from_to(c, a), from_to(b, c), from_to(c, a), from_to(b, c), from_to(a, b), from_to(b, c), from_to(c, a)] .