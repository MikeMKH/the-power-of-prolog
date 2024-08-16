:- use_module(library(clpfd)).

list_list_together([], Bs, Bs).
list_list_together([A|As], Bs, [A|Cs]) :-
  list_list_together(As, Bs, Cs).

% [trace]  ?- list_list_together([], [1,2,3], L).
% Call: (10) list_list_together([], [1, 2, 3], _17148) ? creep
% Exit: (10) list_list_together([], [1, 2, 3], [1, 2, 3]) ? creep
% L = [1, 2, 3].

% [trace]  ?- list_list_together([1,2], [3], L).
% Call: (10) list_list_together([1, 2], [3], _21008) ? creep
% Call: (11) list_list_together([2], [3], _22368) ? creep
% Call: (12) list_list_together([], [3], _23188) ? creep
% Exit: (12) list_list_together([], [3], [3]) ? creep
% Exit: (11) list_list_together([2], [3], [2, 3]) ? creep
% Exit: (10) list_list_together([1, 2], [3], [1, 2, 3]) ? creep
% L = [1, 2, 3].

bad_list_length([_|Ls], N) :-
  bad_list_length(Ls, N0),
  false,
  N #> 0,
  N #= N0 + 1.
bad_list_length([], 0) :- false.

% ?- bad_list_length(Ls, L).
% ERROR: Stack limit (1.0Gb) exceeded
% ERROR:   Stack sizes: local: 0.8Gb, global: 0.1Gb, trail: 30.4Mb
% ERROR:   Stack depth: 3,985,648, last-call: 0%, Choice points: 3,985,641
% ERROR:   Possible non-terminating recursion:
% ERROR:     [3,985,648] user:bad_list_length(_31889272, _31889274)
% ERROR:     [3,985,647] user:bad_list_length([length:1|_31889300], _31889294)
%    Exception: (3,985,647) bad_list_length(_31889196, _31889198) ? abort
% % Execution Aborted

correct_list_length([], 0).
correct_list_length([_|Ls], N) :-
  N #> 0,
  N #= N0 + 1,
  correct_list_length(Ls, N0).

% ?- correct_list_length(Ls, L).
% Ls = [],
% L = 0 ;
% Ls = [_],
% L = 1 ;
% Ls = [_, _],
% L = 2 .