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

reversal([])     --> [].
reversal([L|Ls]) --> reversal(Ls), [L].

% ?- phrase(reversal("1234"), Ls).
% Ls = ['4', '3', '2', '1'].

% ?- phrase(reversal(Rs), "abc").
% Rs = [c, b, a] .

palindrome --> [].
palindrome --> [_].
palindrome --> [E], palindrome, [E].

% ?- phrase(palindrome, "hellolleh").
% true .

% ?- phrase(palindrome, Ls).
% Ls = [] ;
% Ls = [_] ;
% Ls = [_A, _A] .