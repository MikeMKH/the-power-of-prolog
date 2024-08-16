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