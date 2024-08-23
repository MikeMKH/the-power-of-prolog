:- use_module(library(clpfd)).

natnum(z).
natnum(s(N)) :-
  natnum(N).

natnum_sum1(z, M, M).
natnum_sum1(s(M), N, s(Sum)) :-
  natnum_sum1(N, M, Sum).

natnum_sum2(z, M, M).
natnum_sum2(s(M), N, s(Sum)) :-
  natnum_sum2(M, N, Sum).

% [trace]  ?- natnum_sum1(z, s(s(z)), R).
% Call: (10) natnum_sum1(z, s(s(z)), _13726) ? creep
% Exit: (10) natnum_sum1(z, s(s(z)), s(s(z))) ? creep
% R = s(s(z)).

% [trace]  ?- natnum_sum2(z, s(s(z)), R).
% Call: (10) natnum_sum2(z, s(s(z)), _17562) ? creep
% Exit: (10) natnum_sum2(z, s(s(z)), s(s(z))) ? creep
% R = s(s(z)).

% [trace]  ?- natnum_sum1(s(s(z)), z, R).
% Call: (10) natnum_sum1(s(s(z)), z, _21400) ? creep
% Call: (11) natnum_sum1(z, s(z), _22744) ? creep
% Exit: (11) natnum_sum1(z, s(z), s(z)) ? creep
% Exit: (10) natnum_sum1(s(s(z)), z, s(s(z))) ? creep
% R = s(s(z)).

% [trace]  ?- natnum_sum2(s(s(z)), z, R).
% Call: (10) natnum_sum2(s(s(z)), z, _26870) ? creep
% Call: (11) natnum_sum2(s(z), z, _28222) ? creep
% Call: (12) natnum_sum2(z, z, _29040) ? creep
% Exit: (12) natnum_sum2(z, z, z) ? creep
% Exit: (11) natnum_sum2(s(z), z, s(z)) ? creep
% Exit: (10) natnum_sum2(s(s(z)), z, s(s(z))) ? creep
% R = s(s(z)).

% [trace]  ?- natnum_sum1(s(z), s(z), R).
% Call: (10) natnum_sum1(s(z), s(z), _34300) ? creep
% Call: (11) natnum_sum1(s(z), z, _35652) ? creep
% Call: (12) natnum_sum1(z, z, _36470) ? creep
% Exit: (12) natnum_sum1(z, z, z) ? creep
% Exit: (11) natnum_sum1(s(z), z, s(z)) ? creep
% Exit: (10) natnum_sum1(s(z), s(z), s(s(z))) ? creep
% R = s(s(z)).

% [trace]  ?- natnum_sum2(s(z), s(z), R).
% Call: (10) natnum_sum2(s(z), s(z), _41410) ? creep
% Call: (11) natnum_sum2(z, s(z), _42762) ? creep
% Exit: (11) natnum_sum2(z, s(z), s(z)) ? creep
% Exit: (10) natnum_sum2(s(z), s(z), s(s(z))) ? creep
% R = s(s(z)).

list_length([], 0).
list_length([_|Ls], Length) :-
  Length #= 1 + Length0,
  list_length(Ls, Length0).

% ?- list_length(Ls, 0).
% Ls = [] ;
% false.

% ?- list_length(Ls, 1).
% Ls = [_] ;
% false.

% ?- list_length([1,2,3], N).
% N = 3.

% ?- list_length(Ls, N).
% Ls = [],
% N = 0 ;
% Ls = [_],
% N = 1 ;
% Ls = [_, _],
% N = 2 ;
% Ls = [_, _, _],
% N = 3 ;
% Ls = [_, _, _, _],
% N = 4 .

%% nontermination
% ?- list_length(Ls, 1), false.
% ^CAction (h for help) ? abort
% % Execution Aborted