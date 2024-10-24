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