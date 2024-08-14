:- use_module(library(clpfd)).

hailstone(N, N).
hailstone(N0, N) :-
  N0 #= 2*N1,
  hailstone(N1, N).
hailstone(N0, N) :-
  N0 #= 2*_ + 1,
  N1 #= 3*N0 + 1,
  hailstone(N1, N).

% ?- hailstone(3,N).
% N = 3 ;
% N = 10 ;
% N = 5 ;
% N = 16 ;
% N = 8 ;
% N = 4 ;
% N = 2 ;
% N = 1 .

% ?- trace.
% true.

% [trace]  ?- hailstone(3,N).
%    Call: (10) hailstone(3, _74328) ? creep
%    Exit: (10) hailstone(3, 3) ? creep
% N = 3 ;
%    Redo: (10) hailstone(3, _74328) ? creep
%    Call: (11) integer(3) ? creep
%    Exit: (11) integer(3) ? creep
%    Call: (11) _80370=3 ? creep
%    Exit: (11) 3=3 ? creep
%    Call: (11) clpfd:clpfd_equal(3, 2*_81996) ? creep
%    Fail: (11) clpfd:clpfd_equal(3, 2*_81996) ? creep
%    Redo: (10) hailstone(3, _74328) ? creep
%    Call: (11) integer(3) ? creep
%    Exit: (11) integer(3) ? creep
%    Call: (11) _86064=3 ? creep
%    Exit: (11) 3=3 ? creep
%    Call: (11) clpfd:clpfd_equal(3, 2*_87696+1) ? creep
%    Exit: (11) clpfd:clpfd_equal(3, 2*1+1) ? creep
%    Call: (11) integer(3) ? creep
%    Exit: (11) integer(3) ? creep
%    Call: (11) _91384 is 3*3+1 ? creep
%    Exit: (11) 10 is 3*3+1 ? creep
%    Call: (11) hailstone(10, _74328) ? creep
%    Exit: (11) hailstone(10, 10) ? creep
%    Exit: (10) hailstone(3, 10) ? creep
% N = 10 ;
%    Redo: (11) hailstone(10, _74328) ? creep
%    Call: (12) integer(10) ? creep
%    Exit: (12) integer(10) ? creep
%    Call: (12) _99388=10 ? creep
%    Exit: (12) 10=10 ? creep
%    Call: (12) clpfd:clpfd_equal(10, 2*_101014) ? creep
%    Exit: (12) clpfd:clpfd_equal(10, 2*5) ? creep
%    Call: (12) hailstone(5, _74328) ? creep
%    Exit: (12) hailstone(5, 5) ? creep
%    Exit: (11) hailstone(10, 5) ? creep
%    Exit: (10) hailstone(3, 5) ? creep
% N = 5 .

% [trace]  ?- nodebug.
% true.

% ?- hailstone(1,N).
% N = 1 ;
% N = 4 ;
% N = 2 ;
% N = 1 ;
% N = 4 ;
% N = 2 ;
% N = 1 ;
% N = 4 ;
% N = 2 ;
% N = 1 .