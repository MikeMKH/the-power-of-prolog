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

mi1(true).
mi1((A,B)) :-
  mi1(A),
  mi1(B).
mi1(Goal) :-
  Goal \= true,
  Goal \= (_,_),
  clause(Goal, Body),
  mi1(Body).

% ?- mi1(natnum(X)).
% X = 0 ;
% X = s(0) ;
% X = s(s(0)) ;
% X = s(s(s(0))) .

% [trace]  ?- mi1(natnum(X)).
%    Call: (12) mi1(natnum(_88244)) ? creep
%    Call: (13) natnum(_88244)\=true ? creep
%    Exit: (13) natnum(_88244)\=true ? creep
%    Call: (13) natnum(_88244)\=(_91196, _91198) ? creep
%    Exit: (13) natnum(_88244)\=(_91196, _91198) ? creep
% ^  Call: (13) clause(natnum(_88244), _92820) ? creep
% ^  Exit: (13) clause(natnum(0), true) ? creep
%    Call: (13) mi1(true) ? creep
%    Exit: (13) mi1(true) ? creep
%    Exit: (12) mi1(natnum(0)) ? creep
% X = 0 ;
%    Redo: (13) mi1(true) ? creep
%    Call: (14) true\=true ? creep
%    Fail: (14) true\=true ? creep
%    Fail: (13) mi1(true) ? creep
% ^  Redo: (13) clause(natnum(_88244), _92820) ? creep
% ^  Exit: (13) clause(natnum(s(_102520)), natnum(_102520)) ? creep
%    Call: (13) mi1(natnum(_102520)) ? creep
%    Call: (14) natnum(_102520)\=true ? creep
%    Exit: (14) natnum(_102520)\=true ? creep
%    Call: (14) natnum(_102520)\=(_105776, _105778) ? creep
%    Exit: (14) natnum(_102520)\=(_105776, _105778) ? creep
% ^  Call: (14) clause(natnum(_102520), _107400) ? creep
% ^  Exit: (14) clause(natnum(0), true) ? creep
%    Call: (14) mi1(true) ? creep
%    Exit: (14) mi1(true) ? creep
%    Exit: (13) mi1(natnum(0)) ? creep
%    Exit: (12) mi1(natnum(s(0))) ? creep
% X = s(0) .

natnum_clean(0).
natnum_clean(s(X)) :-
  g(natnum_clean(X)).

mi2(true).
mi2((A,B)) :-
  mi2(A),
  mi2(B).
mi2(g(G)) :-
  clause(G, Body),
  mi2(Body).

% ?- mi2(g(natnum_clean(X))).
% X = 0 ;
% X = s(0) ;
% X = s(s(0)) ;
% X = s(s(s(0))) .

% [trace]  ?- mi2(g(natnum_clean(X))).
%    Call: (12) mi2(g(natnum_clean(_129364))) ? creep
% ^  Call: (13) clause(natnum_clean(_129364), _130704) ? creep
% ^  Exit: (13) clause(natnum_clean(0), true) ? creep
%    Call: (13) mi2(true) ? creep
%    Exit: (13) mi2(true) ? creep
%    Exit: (12) mi2(g(natnum_clean(0))) ? creep
% X = 0 ;
% ^  Redo: (13) clause(natnum_clean(_129364), _130704) ? creep
% ^  Exit: (13) clause(natnum_clean(s(_137172)), g(natnum_clean(_137172))) ? creep
%    Call: (13) mi2(g(natnum_clean(_137172))) ? creep
% ^  Call: (14) clause(natnum_clean(_137172), _138810) ? creep
% ^  Exit: (14) clause(natnum_clean(0), true) ? creep
%    Call: (14) mi2(true) ? creep
%    Exit: (14) mi2(true) ? creep
%    Exit: (13) mi2(g(natnum_clean(0))) ? creep
%    Exit: (12) mi2(g(natnum_clean(s(0)))) ? creep
% X = s(0) .