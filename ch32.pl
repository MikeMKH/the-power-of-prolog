:- use_module(library(clpfd)).

timer(Goal, T) :-
  statistics(runtime, [T0|_]),
  Goal,
  statistics(runtime, [T1|_]),
  T #= T1 - T0.

% ?- timer(append([1,2,3], Ys, [1,2,3,4,5,6]), Time).
% Ys = [4, 5, 6],
% Time = 0.

% ?- timer(append(Xs, Ys, [1,2,3,4,5,6]), Time).
% Xs = [],
% Ys = [1, 2, 3, 4, 5, 6],
% Time = 0 ;
% Xs = [1],
% Ys = [2, 3, 4, 5, 6],
% Time = 1 ;
% Xs = [1, 2],
% Ys = [3, 4, 5, 6],
% Time = 1 ;
% Xs = [1, 2, 3],
% Ys = [4, 5, 6],
% Time = 2 ;
% Xs = [1, 2, 3, 4],
% Ys = [5, 6],
% Time = 3 ;
% Xs = [1, 2, 3, 4, 5],
% Ys = [6],
% Time = 3 ;
% Xs = [1, 2, 3, 4, 5, 6],
% Ys = [],
% Time = 4 ;
% false.