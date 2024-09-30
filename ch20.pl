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