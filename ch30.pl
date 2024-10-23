:- use_module(library(clpfd)).

horror_factorial(0, 1) :- !.
horror_factorial(N, F) :-
  N > 0,
  N1 is N - 1,
  horror_factorial(N1, F1),
  F is N*F1.

% ?- horror_factorial(N, F).
% N = 0,
% F = 1.

% ?- horror_factorial(3, F).
% F = 6.

% ?- horror_factorial(N, 8).
% ERROR: Arguments are not sufficiently instantiated
% ERROR: In:
% ERROR:   [13] _21412>0
% ERROR:   [12] horror_factorial(_21438,8) at /Users/mike/Kata/the-power-of-prolog/ch30.pl:5
% ERROR:   [11] toplevel_call(user:user: ...) at /usr/local/Cellar/swi-prolog/9.2.6/lib/swipl/boot/toplevel.pl:1317

horror_factorial1(0, 1).
horror_factorial1(N, F) :-
  N > 0,
  N1 is N - 1,
  horror_factorial1(N1, F1),
  F is N*F1.

% ?- horror_factorial1(N, F).
% N = 0,
% F = 1 ;
% ERROR: Arguments are not sufficiently instantiated
% ERROR: In:
% ERROR:   [13] _68840>0
% ERROR:   [12] horror_factorial1(_68866,_68868) at /Users/mike/Kata/the-power-of-prolog/ch30.pl:26
% ERROR:   [11] toplevel_call(user:user: ...) at /usr/local/Cellar/swi-prolog/9.2.6/lib/swipl/boot/toplevel.pl:1317
% ^  Exception: (4) setup_call_cleanup('$toplevel':notrace(call_repl_loop_hook(begin, 0)), '$toplevel':'$query_loop'(0), '$toplevel':notrace(call_repl_loop_hook(end, 0))) ? abort
% % Execution Aborted

n_factorial(0, 1).
n_factorial(N, F) :-
  N #> 0,
  N1 #= N - 1,
  n_factorial(N1, F1),
  F #= N * F1.

% ?- n_factorial(N, F).
% N = 0,
% F = 1 ;
% N = F, F = 1 ;
% N = F, F = 2 ;
% N = 3,
% F = 6 ;
% N = 4,
% F = 24 ;
% N = 5,
% F = 120 . % and so on...

% ?- n_factorial(3, F).
% F = 6 ;
% false.

% ?- n_factorial(N, 8).
% ^CAction (h for help) ? abort
% % Execution Aborted

% ?- n_factorial(N, 24).
% N = 4 ;
% ^CAction (h for help) ? abort
% % Execution Aborted