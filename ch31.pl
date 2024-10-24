list_list_together([], Bs, Bs).
list_list_together([A|As], Bs, [A|Cs]) :-
  list_list_together(As, Bs, Cs).

% ?- list_list_together([1,2,3],[4,5,6],Rs).
% Rs = [1, 2, 3, 4, 5, 6].

% ?- list_list_together(Xs,[4,5,6],[1,2,3,4,5,6]).
% Xs = [1, 2, 3] ;
% false.

% ?- list_list_together(Xs,Ys,[1,2,3,4,5,6]).
% Xs = [],
% Ys = [1, 2, 3, 4, 5, 6] ;
% Xs = [1],
% Ys = [2, 3, 4, 5, 6] ;
% Xs = [1, 2],
% Ys = [3, 4, 5, 6] ;
% Xs = [1, 2, 3],
% Ys = [4, 5, 6] ;
% Xs = [1, 2, 3, 4],
% Ys = [5, 6] ;
% Xs = [1, 2, 3, 4, 5],
% Ys = [6] ;
% Xs = [1, 2, 3, 4, 5, 6],
% Ys = [] ;
% false.

list_element_rest([L|Ls], L, Ls).
list_element_rest([L|Ls0], E, [L|Ls]) :-
  list_element_rest(Ls0, E, Ls).

slow_list_permutation([], []).
slow_list_permutation(Ls, [E|Ps]) :-
  list_element_rest(Ls, E, Rs),
  slow_list_permutation(Rs, Ps).

fast_list_permutation([], []).
fast_list_permutation([L|Ls0], Ps) :-
  fast_list_permutation(Ls0, Ls),
  list_element_rest(Ps, L, Ls).

% ?- slow_list_permutation([a,b,c], Ps).
% Ps = [a, b, c] ;
% Ps = [a, c, b] ;
% Ps = [b, a, c] ;
% Ps = [b, c, a] ;
% Ps = [c, a, b] ;
% Ps = [c, b, a] ;
% false.

% ?- fast_list_permutation([a,b,c], Ps).
% Ps = [a, b, c] ;
% Ps = [b, a, c] ;
% Ps = [b, c, a] ;
% Ps = [a, c, b] ;
% Ps = [c, a, b] ;
% Ps = [c, b, a] ;
% false.

correct_list([]).
correct_list([_|Ls]) :-
  correct_list(Ls).

wrong_list([]) :- !.
wrong_list([_|Ls]) :-
  wrong_list(Ls).

% ?- correct_list([1,2,3]).
% true.

% ?- wrong_list([1,2,3]).
% true.

% ?- correct_list(Ls).
% Ls = [] ;
% Ls = [_] ;
% Ls = [_, _] ;
% Ls = [_, _, _] ;
% Ls = [_, _, _, _] ;
% Ls = [_, _, _, _, _] ;
% Ls = [_, _, _, _, _, _] . % and so on..

% ?- wrong_list(Ls).
% Ls = [].