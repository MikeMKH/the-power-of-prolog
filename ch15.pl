lists(["abcd",
       "abc",
       "abcde",
       "a",
       "ab"]).

list_pair(Ls, L-Ls) :-
 length(Ls, L).

% ?- lists(Lists), list_pair(Lists, Pairs).
% Lists = [[a, b, c, d], [a, b, c], [a, b, c, d, e], [a], [a, b]],
% Pairs = 5-[[a, b, c, d], [a, b, c], [a, b, c, d, e], [a], [a, b]].

% ?- lists(Lists), maplist(list_pair, Lists, Pairs0), keysort(Pairs0, Pairs).
% Lists = [[a, b, c, d], [a, b, c], [a, b, c, d, e], [a], [a, b]],
% Pairs0 = [4-[a, b, c, d], 3-[a, b, c], 5-[a, b, c, d, e], 1-[a], 2-[a, b]],
% Pairs = [1-[a], 2-[a, b], 3-[a, b, c], 4-[a, b, c, d], 5-[a, b, c|...]].

