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

mi_clause(G, Body) :-
  clause(G, B),
  defaulty_better(B, Body).

defaulty_better(true, true).
defaulty_better((A,B), (BA,BB)) :-
  defaulty_better(A, BA),
  defaulty_better(B, BB).
defaulty_better(G, g(G)) :-
  G \= true,
  G \= (_,_).

mi3(true).
mi3((A,B)) :-
  % B then A
  mi3(B),
  mi3(A).
mi3(g(G)) :-
  mi_clause(G, Body),
  mi3(Body).

declarative_false :-
  declarative_false,
  false.

% ?- declarative_false.
% ERROR: Stack limit (1.0Gb) exceeded
% ERROR:   Stack sizes: local: 1.0Gb, global: 0.6Mb, trail: 0Kb
% ERROR:   Stack depth: 16,753,775, last-call: 0%, Choice points: 4
% ERROR:   Probable infinite recursion (cycle):
% ERROR:     [16,753,775] user:declarative_false
% ERROR:     [16,753,774] user:declarative_false
% ^  Exception: (4) setup_call_cleanup('$toplevel':notrace(call_repl_loop_hook(begin, 0)), '$toplevel':'$query_loop'(0), '$toplevel':notrace(call_repl_loop_hook(end, 0))) ? abort
% % Execution Aborted
% ?- mi3(declarative_false).
% false.

% ?- mi2(declarative_false).
% false.

% ?- mi1(declarative_false).
% ERROR: Stack limit (1.0Gb) exceeded
% ERROR:   Stack sizes: local: 0.5Gb, global: 0.2Gb, trail: 76.8Mb
% ERROR:   Stack depth: 6,710,467, last-call: 50%, Choice points: 3,355,232
% ERROR:   Possible non-terminating recursion:
% ERROR:     [6,710,466] user:mi1(declarative_false)
% ERROR:     [6,710,465] user:mi1(<compound (',')/2>)
%    Exception: (6,710,465) mi1((declarative_false, false)) ? abort
% % Execution Aborted

mi_list1([]).
mi_list1([G|Gs]) :-
  mi_clause(G, Body),
  mi_list1(Body),
  mi_list1(Gs).

mi_list2([]).
mi_list2([G0|Gs0]) :-
  mi_clause(G0, Body),
  append(Body, Gs0, Gs), % tail-recursive
  mi_list2(Gs).

always_infinite :-
  always_infinite.

% % does not work like it does here https://www.metalevel.at/acomip/
% ?- mi_list1([always_infinite]).
% false.

% ?- mi_list2([always_infinite]).
% false.

% ?- trace.
% true.

% [trace]  ?- mi_list1([always_infinite]).
%    Call: (12) mi_list1([always_infinite]) ? creep
%    Call: (13) mi_clause(always_infinite, _20940) ? creep
%    Fail: (13) mi_clause(always_infinite, _20940) ? creep
%    Fail: (12) mi_list1([always_infinite]) ? creep
% false.

mi_ldclause(natnum(0), Rest, Rest).
mi_ldclause(natnum(s(X)), [natnum(X)|Rest], Rest).

mi_list3([]).
mi_list3([G0|Gs0]) :-
  mi_ldclause(G0, Remaining, Gs0),
  mi_list3(Remaining).

% ?- mi_list1([natnum(X)]).
% false.

% ?- mi_list2([natnum(X)]).
% false.

% ?- mi_list3([natnum(X)]).
% X = 0 ;
% X = s(0) ;
% X = s(s(0)) ;
% X = s(s(s(0))) .

mi_circ(true).
mi_circ((A,B)) :-
  mi_circ(A),
  mi_circ(B).
mi_circ(clause(A,B)) :-
  clause(A,B).
mi_circ(A \= B) :-
  A \= B.
mi_circ(G) :-
  G \= true,
  G \= (_,_),
  G \= (_\=_),
  G \= clause(_,_),
  clause(G, Body),
  mi_circ(Body).

% ?- mi_circ(mi_circ(natnum(X))).
% X = 0 ;
% X = s(0) ;
% X = s(s(0)) ;
% X = s(s(s(0))) .

provable(true, _).
provable((A,B), Defs) :-
  provable(A, Defs),
  provable(B, Defs).
provable(g(Goal), Defs) :-
  ( predicate_property(Goal, built_in) ->
    call(Goal)
  ; member(Def, Defs),
    copy_term(Def, Goal-Body),
    provable(Body, Defs)
  ).

redundant(Functor/Arity, Reds) :-
  functor(Term, Functor, Arity),
  findall(Term-Body, mi_clause(Term, Body), Defs),
  setof(Red, Defs^redundant_(Defs, Red), Reds).

redundant_(Defs, Fact) :-
  select(Fact-true, Defs, Rest),
  once(provable(g(Fact), Rest)).

as([]).
as([a]).   % redundant
as([a,a]). % redundant
as([A|As]) :-
  A = a,   % test built-in (=)/2
  true,    % test built-in true/0
  as(As).

% ?- redundant(as/1, Rs).
% Rs = [as([a]), as([a, a])].

:- op(750, xfy, =>).

mi_tree(true, true).
mi_tree((A,B), (TA,TB)) :-
  mi_tree(A, TA),
  mi_tree(B, TB).
mi_tree(g(G), TBody => G) :-
  mi_clause(G, Body),
  mi_tree(Body, TBody).

% ?- mi_tree(g(natnum(X)), T).
% X = 0,
% T = (true=>natnum(0)) ;
% X = s(0),
% T = ((true=>natnum(0))=>natnum(s(0))) ;
% X = s(s(0)),
% T = (((true=>natnum(0))=>natnum(s(0)))=>natnum(s(s(0)))) .

mi_limit(Goal, Max) :-
  mi_limit(Goal, Max, _).

mi_limit(true, N, N).
mi_limit((A,B), N0, N) :-
  mi_limit(A, N0, N1),
  mi_limit(B, N1, N).
mi_limit(g(G), N0, N) :-
  N0 #> 0,
  N1 #= N0 - 1,
  mi_clause(G, Body),
  mi_limit(Body, N1, N).

% ?- mi_limit(g(natnum(X)), 3).
% X = 0 ;
% X = s(0) ;
% X = s(s(0)) ;
% false.

% ?- mi_limit(g(natnum(X)), 1).
% X = 0 ;
% false.