:- use_module(library(clpfd)).

% not pure

% ?- integer(I).
% false.

% ?- integer(3).
% true.

% ?- X \= Y.
% false.

% ?- a \= b.
% true.

% ?- X =:= Y.
% ERROR: Arguments are not sufficiently instantiated
% ERROR: In:
% ERROR:   [10] _24368=:=_24370
% ERROR:    [9] toplevel_call(user:user: ...) at /usr/local/Cellar/swi-prolog/9.0.4/libexec/lib/swipl/boot/toplevel.pl:1173
% ?- 3 =:= X, X =:= Y.
% ERROR: Arguments are not sufficiently instantiated
% ERROR: In:
% ERROR:   [11] 3=:=_1752
% ERROR:   [10] <meta-call>(user:user: ...) <foreign>
% ERROR:    [9] toplevel_call(user:user: ...) at /usr/local/Cellar/swi-prolog/9.0.4/libexec/lib/swipl/boot/toplevel.pl:1173


% pure

% ?- I in inf..sup.
% I in inf..sup.

% ?- 3 in inf..sup.
% true.

% ?- dif(X, Y).
% dif(X, Y).

% ?- dif(a, b).
% true.

% ?- X #= Y.
% X = Y,
% Y in inf..sup.

% ?- 3 #= X, X #= Y.
% X = Y, Y = 3.