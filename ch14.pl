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