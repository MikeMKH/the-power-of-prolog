% ?- maplist(dif(E), Ls).
% Ls = [] ;
% Ls = [_A],
% dif(E, _A) ;
% Ls = [_A, _B],
% dif(E, _A),
% dif(E, _B) ;
% Ls = [_A, _B, _C],
% dif(E, _A),
% dif(E, _C),
% dif(E, _B) .

:- use_module(library(clpfd)).
% use for if/3 https://www.swi-prolog.org/pldoc/doc/_SWI_/library/dialect/sicstus.pl
:- expects_dialect(sicstus).

hailstone(N, N).
hailstone(N0, N) :-
  R #= N0 mod 2,
  if(R = 0,
    N0 #= 2*N1,
    N1 #= 3*N0 + 1),
  hailstone(N1, N).

% ?- hailstone(3, N).
% N = 3 ;
% N = 10 ;
% N = 5 ;
% N = 16 ;
% N = 8 ;
% N = 4 ;
% N = 2 ;
% N = 1 .

sum_(A, B, Sum) :- Sum #= A + B.
inc_(X, R) :- call(sum_(1), X, R).

% ?- sum_(1,2,R).
% R = 3.

% ?- sum_(1,Y,3).
% Y = 2.

% ?- sum_(X,Y,3).
% X+Y#=3.

% ?- inc_(2,R).
% R = 3.

% ?- inc_(X,5).
% X = 4.

% ?- maplist(inc_, [1,2,3], Ys).
% Ys = [2, 3, 4].

% ?- maplist(inc_, Xs, [5,6,7]).
% Xs = [4, 5, 6].

% ?- foldl(sum_, [1,2,3], 0, R).
% R = 6.

% ?- foldl(sum_, Xs, 0, 4).
% Xs = [4] ;
% Xs = [_A, _B],
% _B+_A#=4 ;
% Xs = [_A, _B, _C],
% _B+_A#=_D,
% _C+_D#=4 .