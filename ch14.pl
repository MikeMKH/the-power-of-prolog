:- set_prolog_flag(double_quotes, chars).

as --> [].
as --> [a], as.

% ?- phrase(as, "aa").
% true.

% ?- phrase(as, [a, a]).
% true.

% ?- phrase(as, "").
% true.

% ?- phrase(as, "b").
% false.

% ?- phrase(as, Ls).
% Ls = [] ;
% Ls = [a] ;
% Ls = [a, a] ;
% Ls = [a, a, a] .

seq([])     --> [].
seq([E|Es]) --> [E], seq(Es).

% ?- phrase(("Hello, ",seq(Cs),"!"), "Hello, Lily!").
% Cs = ['L', i, l, y] ;
% false.

seqq([]) --> [].
seqq([Es|Ess]) -->
  seq(Es),
  seqq(Ess).

% ?- phrase(seqq(["ab","cd","ef"]), Ls).
% Ls = [a, b, c, d, e, f].

... --> [] | [_], ... .

% ?- phrase((...,[Last]), "Lily").
% Last = y ;
% false.

% ?- phrase((...,[E,E],...), Ls).
% Ls = [E, E] ;
% Ls = [E, E, _] ;
% Ls = [E, E, _, _] ;
% Ls = [E, E, _, _, _] ;
% Ls = [E, E, _, _, _, _] .

% ?- length(Ls, _), phrase((...,[E,E],...), Ls).
% Ls = [E, E] ;
% Ls = [E, E, _] ;
% Ls = [_, E, E] ;
% Ls = [E, E, _, _] ;
% Ls = [_, E, E, _] ;
% Ls = [_, _, E, E] ;
% Ls = [E, E, _, _, _] .