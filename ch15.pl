lists(["abcd",
       "abc",
       "abcde",
       "a",
       "ab"]).

list_pair(Ls, L-Ls) :-
 length(Ls, L).

% ?- lists(Lists), list_pair(Lists, Pairs).
% Lists = [[a, b, c, d], [a, b, c], [a, b, c, d, e], [a], [a, b]],
% Pairs = 5-[[a, b, c, d], [a, b, c], [a, b, c, d, e], [a], [a, b]].

% ?- lists(Lists), maplist(list_pair, Lists, Pairs0), keysort(Pairs0, Pairs).
% Lists = [[a, b, c, d], [a, b, c], [a, b, c, d, e], [a], [a, b]],
% Pairs0 = [4-[a, b, c, d], 3-[a, b, c], 5-[a, b, c, d, e], 1-[a], 2-[a, b]],
% Pairs = [1-[a], 2-[a, b], 3-[a, b, c], 4-[a, b, c, d], 5-[a, b, c|...]].

quicksort([]) --> [].
quicksort([L|Ls]) -->
  { partition_(Ls, L, Smaller, Bigger) },
  quicksort(Smaller),
  [L],
  quicksort(Bigger).

partition_([], _, [], []).
partition_([L|Ls], Pivot, Smaller0, Bigger0) :-
  ( L @< Pivot ->
    Smaller0 = [L|Smaller],
    partition_(Ls, Pivot, Smaller, Bigger0)
  ; Bigger0 = [L|Bigger],
    partition_(Ls, Pivot, Smaller0, Bigger)
  ).

% ?- lists(Lists), phrase(quicksort(Lists), Sorted).
% Lists = [[a, b, c, d], [a, b, c], [a, b, c, d, e], [a], [a, b]],
% Sorted = [[a], [a, b], [a, b, c], [a, b, c, d], [a, b, c, d|...]].

% ?- phrase(quicksort([a,b,c,1,5,0,x]), Ls).
% Ls = [0, 1, 5, a, b, c, x].

:- use_module(library(clpfd)).

list_minimum([L|Ls], Min) :- foldl(minimum_, Ls, L, Min).
minimum_(X, Y, Min) :- Min #= min(X, Y).

% ?- list_minimum([1,2,3], Min).
% Min = 1.

% ?- list_minimum([3,1,2], Min).
% Min = 1.

% ?- list_minimum(Ls, 1).
% Ls = [1] ;
% Ls = [_A, _B],
% _B in 1..sup,
% 1#=min(_B, _A),
% _A in 1..sup ;
% Ls = [_A, _B, _C],
% _B in 1..sup,
% _B#>=_D,
% _D#=min(_B, _A),
% _A in 1..sup,
% _A#>=_D,
% _D in 1..sup,
% 1#=min(_C, _D),
% _C in 1..sup .

% start from: https://www.complang.tuwien.ac.at/ulrich/Prolog-inedit/swi/reif.pl

if_(If_1, Then_0, Else_0) :-
  call(If_1, T),
  (  T == true -> Then_0
  ;  T == false -> Else_0
  ;  nonvar(T) -> throw(error(type_error(boolean,T),
                              type_error(call(If_1,T),2,boolean,T)))
  ;  throw(error(instantiation_error,instantiation_error(call(If_1,T),2)))
  ).


tfilter(C_2, Es, Fs) :-
  i_tfilter(Es, C_2, Fs).

i_tfilter([], _, []).
i_tfilter([E|Es], C_2, Fs0) :-
  if_(call(C_2, E), Fs0 = [E|Fs], Fs0 = Fs),
  i_tfilter(Es, C_2, Fs).

=(X, Y, T) :-
  (  X == Y -> T = true
  ;  X \= Y -> T = false
  ;  T = true, X = Y
  ;  T = false,
     dif(X, Y)
  ).

non(true, false).
non(false, true).

dif(X, Y, T) :-
  =(X, Y, NT),
  non(NT, T).

% end from: https://www.complang.tuwien.ac.at/ulrich/Prolog-inedit/swi/reif.pl

k_n(N, Adjs) :-
  length(Nodes, N),
  Nodes ins 1..N,
  all_distinct(Nodes),
  once(label(Nodes)),
  maplist(adjs(Nodes), Nodes, Adjs).

adjs(Nodes, Node, Node-As) :-
  tfilter(dif(Node), Nodes, As).

% ?- k_n(1, Adjs).
% Adjs = [1-[]].

% ?- k_n(2, Adjs).
% Adjs = [1-[2], 2-[1]].

% ?- k_n(3, Adjs).
% Adjs = [1-[2, 3], 2-[1, 3], 3-[1, 2]].

reachable(_, _, From, From).
reachable(Adjs, Visited, From, To) :-
        maplist(dif(Next), Visited),
        member(From-As, Adjs),
        member(Next, As),
        reachable(Adjs, [From|Visited], Next, To).

% ?- k_n(3, Adjs), setof(To, reachable(Adjs, [], 1, To), Tos).
% Adjs = [1-[2, 3], 2-[1, 3], 3-[1, 2]],
% Tos = [1, 2, 3].

warshall(Adjs, Nodes0, Nodes) :-
  phrase(reachables(Nodes0, Adjs), Nodes1, Nodes0),
  sort(Nodes1, Nodes2),
  if_(Nodes2 = Nodes0,
      Nodes = Nodes2,
      warshall(Adjs, Nodes2, Nodes)).

reachables([], _) --> [].
reachables([Node|Nodes], Adjs) -->
        { member(Node-Rs, Adjs) },
        Rs,
        reachables(Nodes, Adjs).

% ?- k_n(3, Adjs), setof(To, warshall(Adjs, [1], To), Tos).
% Adjs = [1-[2, 3], 2-[1, 3], 3-[1, 2]],
% Tos = [[1, 2, 3]].

% ?- k_n(3, Adjs), warshall(Adjs, [1], Tos).
% Adjs = [1-[2, 3], 2-[1, 3], 3-[1, 2]],
% Tos = [1, 2, 3] ;
% false.

% ?- k_n(9, Adjs), warshall(Adjs, [1], Tos).
% Adjs = [1-[2, 3, 4, 5, 6, 7, 8|...], 2-[1, 3, 4, 5, 6, 7|...], 3-[1, 2, 4, 5, 6|...], 4-[1, 2, 3, 5|...], 5-[1, 2, 3|...], 6-[1, 2|...], 7-[1|...], 8-[...|...], ... - ...],
% Tos = [1, 2, 3, 4, 5, 6, 7, 8, 9] ;
% false.

ascending([]).
ascending([L|Ls]) :-
  foldl(ascending_, Ls, L, _).
ascending_(X, Prev, X) :- Prev #=< X.

% ?- ascending([1,2,3]).
% true.

% ?- ascending([1,3,2]).
% false.

% ?- ascending(R).
% R = [] ;
% R = [_] ;
% R = [_A, _B],
% _B#>=_A ;
% R = [_A, _B, _C],
% _C#>=_B,
% _B#>=_A .

integers_ascending(Ls0, Ls) :-
  all_distinct(Ls0),
  ascending(Ls),
  permutation(Ls0, Ls).

% ?- integers_ascending([1,2,3], R).
% R = [1, 2, 3] ;
% false.

% ?- integers_ascending([3,2,1], R).
% R = [1, 2, 3] ;
% false.

% ?- integers_ascending([X,Y,Z], [1,2,3]).
% X = 1,
% Y = 2,
% Z = 3 ;
% X = 1,
% Y = 3,
% Z = 2 ;
% X = 2,
% Y = 1,
% Z = 3 ;
% X = 3,
% Y = 1,
% Z = 2 ;
% X = 2,
% Y = 3,
% Z = 1 ;
% X = 3,
% Y = 2,
% Z = 1 ;
% false.