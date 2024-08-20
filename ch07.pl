% terminates existentially
% ?- length(Ls, L).
% Ls = [],
% L = 0 .

% terminates universally
% ?- false.
% false.

% nonterminating
% list_list_together([], Bs, Bs), false.
% list_list_together([A|As], Bs, [A|Cs]) :-
%   list_list_together(As, Bs, Cs).

% ?- list_list_together([], [1,2,3], L).
% false.

% ?- list_list_together([1], [2,3], L).
% false.

% ?- list_list_together([1,2], L, [1,2,3]).
% false.