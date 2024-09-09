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
