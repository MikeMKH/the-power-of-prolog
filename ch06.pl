% list_list_together([], Bs, Cs) :-
%   Bs = Cs.
% list_list_together([A|As], Bs, Cs) :-
%   Cs = [A|Rest],
%   list_list_together(As, Bs, Rest).

list_list_together([], Bs, Bs).
list_list_together([A|As], Bs, [A|Cs]) :-
  list_list_together(As, Bs, Cs).

% ?- list_list_together([], [1,2,3], L).
% L = [1, 2, 3].

% ?- list_list_together([1], [2,3], L).
% L = [1, 2, 3].

% ?- list_list_together([1,2], L, [1,2,3]).
% L = [3].