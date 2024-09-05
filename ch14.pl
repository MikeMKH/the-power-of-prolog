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

tree_nodes_left_recurision(nil) --> [].
tree_nodes_left_recurision(node(Name, Left, Right)) -->
  tree_nodes_left_recurision(Left),
  [Name],
  tree_nodes_left_recurision(Right).

% ?- phrase(tree_nodes_left_recurision(node(a, node(b, nil, node(c, nil, nil)), node(d, nil, nil))), Ns).
% Ns = [b, c, a, d].

% ?- phrase(tree_nodes_left_recurision(Tree), "abcd").
% Tree = node(a, nil, node(b, nil, node(c, nil, node(d, nil, nil)))) ;
% ERROR: Stack limit (1.0Gb) exceeded
% ERROR:   Stack sizes: local: 0.7Gb, global: 0.2Gb, trail: 2Kb
% ERROR:   Stack depth: 6,145,462, last-call: 0%, Choice points: 7
% ERROR:   In:
% ERROR:     [6,145,462] user:tree_nodes_left_recurision(_61474470, [], _61474474)
% ERROR:     [6,145,461] user:tree_nodes_left_recurision(<compound node/3>, [], _61474496)
% ERROR:     [6,145,460] user:tree_nodes_left_recurision(<compound node/3>, [], _61474524)
% ERROR:     [6,145,459] user:tree_nodes_left_recurision(<compound node/3>, [], _61474552)
% ERROR:     [6,145,458] user:tree_nodes_left_recurision(<compound node/3>, [], _61474580)
% ERROR: 
% ERROR: Use the --stack_limit=size[KMG] command line option or
% ERROR: ?- set_prolog_flag(stack_limit, 2_147_483_648). to double the limit.

tree_nodes(nil, Ls, Ls) --> [].
tree_nodes(node(Name, Left, Right), [_|Ls0], Ls) -->
  tree_nodes(Left, Ls0, Ls1),
  [Name],
  tree_nodes(Right, Ls1, Ls).

% ?- Ns = "abcd", phrase(tree_nodes(Tree, Ns, _), Ns).
% Ns = [a, b, c, d],
% Tree = node(a, nil, node(b, nil, node(c, nil, node(d, nil, nil)))) ;
% Ns = [a, b, c, d],
% Tree = node(a, nil, node(b, nil, node(d, node(c, nil, nil), nil))) ;
% Ns = [a, b, c, d],
% Tree = node(a, nil, node(c, node(b, nil, nil), node(d, nil, nil))) ;
% Ns = [a, b, c, d],
% Tree = node(a, nil, node(d, node(b, nil, node(c, nil, nil)), nil)) ;
% Ns = [a, b, c, d],
% Tree = node(a, nil, node(d, node(c, node(b, nil, nil), nil), nil)) ;
% Ns = [a, b, c, d],
% Tree = node(b, node(a, nil, nil), node(c, nil, node(d, nil, nil))) ;
% Ns = [a, b, c, d],
% Tree = node(b, node(a, nil, nil), node(d, node(c, nil, nil), nil)) ;
% Ns = [a, b, c, d],
% Tree = node(c, node(a, nil, node(b, nil, nil)), node(d, nil, nil)) ;
% Ns = [a, b, c, d],
% Tree = node(d, node(a, nil, node(b, nil, node(c, nil, nil))), nil) ;
% Ns = [a, b, c, d],
% Tree = node(d, node(a, nil, node(c, node(b, nil, nil), nil)), nil) ;
% Ns = [a, b, c, d],
% Tree = node(c, node(b, node(a, nil, nil), nil), node(d, nil, nil)) ;
% Ns = [a, b, c, d],
% Tree = node(d, node(b, node(a, nil, nil), node(c, nil, nil)), nil) ;
% Ns = [a, b, c, d],
% Tree = node(d, node(c, node(a, nil, node(b, nil, nil)), nil), nil) ;
% Ns = [a, b, c, d],
% Tree = node(d, node(c, node(b, node(a, nil, nil), nil), nil), nil) ;
% false.

% ?- phrase(tree_nodes(Tree, "abcd", _), "abcd").
% Tree = node(a, nil, node(b, nil, node(c, nil, node(d, nil, nil)))) ;
% Tree = node(a, nil, node(b, nil, node(d, node(c, nil, nil), nil))) ;
% Tree = node(a, nil, node(c, node(b, nil, nil), node(d, nil, nil))) ;
% Tree = node(a, nil, node(d, node(b, nil, node(c, nil, nil)), nil)) ;
% Tree = node(a, nil, node(d, node(c, node(b, nil, nil), nil), nil)) .

% ?- phrase(tree_nodes(Tree, _, "abcd"), "abcd").
% Tree = node(a, nil, node(b, nil, node(c, nil, node(d, nil, nil)))) ;
% ERROR: Stack limit (1.0Gb) exceeded
% ERROR:   Stack sizes: local: 0.5Gb, global: 0.2Gb, trail: 0Kb
% ERROR:   Stack depth: 3,355,308, last-call: 0%, Choice points: 7
% ERROR:   In:
% ERROR:     [3,355,308] user:tree_nodes(_60410552, _60410554, _60410556, [], _60410560)
% ERROR:     [3,355,307] user:tree_nodes(<compound node/3>, [length:1|_60410598], _60410582, [], _60410586)
% ERROR:     [3,355,306] user:tree_nodes(<compound node/3>, [length:2|_60410636], _60410620, [], _60410624)
% ERROR:     [3,355,305] user:tree_nodes(<compound node/3>, [length:3|_60410674], _60410658, [], _60410662)
% ERROR:     [3,355,304] user:tree_nodes(<compound node/3>, [length:4|_60410712], _60410696, [], _60410700)
% ERROR: 
% ERROR: Use the --stack_limit=size[KMG] command line option or
% ERROR: ?- set_prolog_flag(stack_limit, 2_147_483_648). to double the limit.

nt1, [b] --> [a].
nt2      --> [b].

% ?- phrase((nt1, nt2), "a").
% true.

% ?- phrase(nt1, "a").
% false.

% ?- phrase(nt1, "a", Rest).
% Rest = [b].

look_ahead(T), [T] --> [T].

% ?- phrase(look_ahead(T), "123", Rest).
% T = '1',
% Rest = ['1', '2', '3'].

:- use_module(library(clpfd)).

num_leaves(Tree, N) :-
  phrase(num_leaves_(Tree), [0], [N]).

  num_leaves_(nil), [N] --> [N0], { N #= N0 + 1 }.
  num_leaves_(node(_, Left, Right)) -->
    num_leaves_(Left),
    num_leaves_(Right).

% ?- num_leaves(node(a, node(b, nil, nil), node(c, nil, node(d, nil, nil))), N).
% N = 5.

:- use_module(library(pure_input)).

% ?- phrase_from_file(seq(Chars), "ch14.pl").
% Chars = [58, 45, 32, 115, 101, 116, 95, 112, 114|...] .

lines([])     --> call(eos), !.
lines([L|Ls]) --> line(L), lines(Ls).

line([])      --> ( "\n" | call(eos) ), !.
line([C|Cs])  --> [C], line(Cs).

eos([], []).

% ?- phrase_from_file(lines(Ls), "ch14.pl").
% Ls = [[58, 45, 32, 115, 101, 116, 95, 112|...]].

include(Goal, List, Included) :-
  phrase(include_(List, Goal), Included).

include_([], _) --> [].
include_([L|Ls], Goal) -->
  ( { call(Goal, L) } ->
    [L]
  ; []
  ),
  include_(Ls, Goal).

% ?- include(number, [a,b,c,1,e,2], Nums).
% Nums = [1, 2].