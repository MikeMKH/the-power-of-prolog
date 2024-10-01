:- set_prolog_flag(double_quotes, chars).
:- use_module(library(clpfd)).

% A chicken farmer also has some cows for a total of 30 animals, and the animals have 74 legs in all.
% How many chickens does the farmer have?

% ?- Chickens + Cows #= 30,
% |    (Chickens * 2) + (Cows * 4) #= 74,
% |    Chickens in 0..sup,
% |    Cows in 0..sup.
% Chickens = 23,
% Cows = 7.

regions(Rs) :-
  Rs = [A,B,C,D,E,F],
  Rs ins 0..3, % 4 colors
  A #\= B, A #\= C, A #\= D, A #\= F,
  B #\= C, B #\= D,
  C #\= D, C #\= E,
  D #\= E, D #\= F,
  E #\= F.

%   ?- regions(Rs), label(Rs).
% Rs = [0, 1, 2, 3, 0, 1] ;
% Rs = [0, 1, 2, 3, 0, 2] ;
% Rs = [0, 1, 2, 3, 1, 2] ;
% Rs = [0, 1, 3, 2, 0, 1] ;
% Rs = [0, 1, 3, 2, 0, 3] ;
% Rs = [0, 1, 3, 2, 1, 3] ;
% Rs = [0, 2, 1, 3, 0, 1] . % and so on...

integer_color(0, red).
integer_color(1, green).
integer_color(2, blue).
integer_color(3, gray).

% ?- regions(Rs), label(Rs),
% |    maplist(integer_color, Rs, Cs),
% |    pairs_keys_values(Pairs, "abcdef", Cs). % must have set_prolog_flag(double_quotes, chars).
% Rs = [0, 1, 2, 3, 0, 1],
% Cs = [red, green, blue, gray, red, green],
% Pairs = [a-red, b-green, c-blue, d-gray, e-red, f-green] ;
% Rs = [0, 1, 2, 3, 0, 2],
% Cs = [red, green, blue, gray, red, blue],
% Pairs = [a-red, b-green, c-blue, d-gray, e-red, f-blue] ;
% Rs = [0, 1, 2, 3, 1, 2],
% Cs = [red, green, blue, gray, green, blue],
% Pairs = [a-red, b-green, c-blue, d-gray, e-green, f-blue] ;
% Rs = [0, 1, 3, 2, 0, 1],
% Cs = [red, green, gray, blue, red, green],
% Pairs = [a-red, b-green, c-gray, d-blue, e-red, f-green] ;
% Rs = [0, 1, 3, 2, 0, 3],
% Cs = [red, green, gray, blue, red, gray],
% Pairs = [a-red, b-green, c-gray, d-blue, e-red, f-gray] ;
% Rs = [0, 1, 3, 2, 1, 3],
% Cs = [red, green, gray, blue, green, gray],
% Pairs = [a-red, b-green, c-gray, d-blue, e-green, f-gray] . % and so on...

% Directed graphs

arc_from_to(a, b).
arc_from_to(b, c).
arc_from_to(a, c).
arc_from_to(c, a).

path_from_to(A, A, _) --> [A].
path_from_to(A, B, Visited) --> [A],
  { arc_from_to(A, Next),
    maplist(dif(Next), Visited) },
  path_from_to(Next, B, [A|Visited]).

% ?- phrase(path_from_to(a, c, []), Ps).
% Ps = [a, b, c] ;
% Ps = [a, c] ;
% false.

% ?- phrase(path_from_to(a, To, []), Ps).
% To = a,
% Ps = [a] ;
% To = b,
% Ps = [a, b] ;
% To = c,
% Ps = [a, b, c] ;
% To = c,
% Ps = [a, c] ;
% false.

% ?- phrase(path_from_to(From, To, []), Ps).
% From = To,
% Ps = [To] ;
% From = a,
% To = b,
% Ps = [a, b] ;
% From = a,
% To = c,
% Ps = [a, b, c] ;
% From = b,
% To = c,
% Ps = [b, c] ;
% From = b,
% To = a,
% Ps = [b, c, a] ;
% From = a,
% To = c,
% Ps = [a, c] ;
% From = c,
% To = a,
% Ps = [c, a] ;
% From = c,
% To = b,
% Ps = [c, a, b] ;
% false.

% ?- findall(From-To, arc_from_to(From, To), Arcs).
% Arcs = [a-b, b-c, a-c, c-a].

% ?- bagof(To, arc_from_to(From, To), Arcs).
% From = a,
% Arcs = [b, c] ;
% From = b,
% Arcs = [c] ;
% From = c,
% Arcs = [a].

