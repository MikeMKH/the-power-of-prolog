:- use_module(library(clpfd)).

natnum(0).
natnum(s(X)) :-
  natnum(X).

% ?- Goal = natnum(X), Goal.
% Goal = natnum(0),
% X = 0 ;
% Goal = natnum(s(0)),
% X = s(0) ;
% Goal = natnum(s(s(0))),
% X = s(s(0)) ;
% Goal = natnum(s(s(s(0)))),
% X = s(s(s(0))) .

% ?- trace.
% true.

% [trace]  ?- Goal = natnum(X), Goal.
%    Call: (13) _33942=natnum(_33938) ? creep
%    Exit: (13) natnum(_33938)=natnum(_33938) ? creep
%    Call: (13) natnum(_33938) ? creep
%    Exit: (13) natnum(0) ? creep
% Goal = natnum(0),
% X = 0 ;
%    Redo: (13) natnum(_33938) ? creep
%    Call: (14) natnum(_40606) ? creep
%    Exit: (14) natnum(0) ? creep
%    Exit: (13) natnum(s(0)) ? creep
% Goal = natnum(s(0)),
% X = s(0) ;
%    Redo: (14) natnum(_40606) ? creep
%    Call: (15) natnum(_45792) ? creep
%    Exit: (15) natnum(0) ? creep
%    Exit: (14) natnum(s(0)) ? creep
%    Exit: (13) natnum(s(s(0))) ? creep
% Goal = natnum(s(s(0))),
% X = s(s(0)) .

% ?- clause(natnum(Z), Body).
% Z = 0,
% Body = true ;
% Z = s(_A),
% Body = natnum(_A).

complicated_clause(A) :-
  goal1(A),
  goal2(A),
  goal3(A).

% ?- clause(complicated_clause(Z), Body).
% Body = (goal1(Z), goal2(Z), goal3(Z)).

