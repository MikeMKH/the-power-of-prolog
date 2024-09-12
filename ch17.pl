:- use_module(library(clpfd)).

add(I0, N, I) :- I #= I0 + N.

% ?- add(1,2,R).
% R = 3.

% ?- add(1,R,3).
% R = 2.

% ?- add(X,Y,3).
% X+Y#=3.