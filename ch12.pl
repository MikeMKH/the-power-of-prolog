:- use_module(library(clpfd)).

wrong_list_length([], 0).
wrong_list_length([_|Ls], N) :-
  N #> 0,
  N #= N0 + 2,
  wrong_list_length(Ls, N0).

% ?- wrong_list_length([], N).
% N = 0.

% ?- wrong_list_length([a], N).
% N = 2.

% ?- wrong_list_length([a,b], N).
% N = 4.

% ?- wrong_list_length(Ls, _).
% Ls = [] ;
% Ls = [_] ;
% Ls = [_, _] ;
% Ls = [_, _, _] .

% % does not terminates universally, as expected
% ?- wrong_list_length(Ls, L), false.
% ^CAction (h for help) ? abort
% % Execution Aborted

% % check that we have a relationship for all lists
% ?- maplist(=(a), Ls), \+ wrong_list_length(Ls, _).
% ^CAction (h for help) ? abort
% % Execution Aborted
% ?- maplist(=(_), Ls), \+ wrong_list_length(Ls, _).
% ^CAction (h for help) ? abort
% % Execution Aborted

% % check against reference implementation
% ?- A #\= B, length(Ls, A), wrong_list_length(Ls, B).
% A = 1,
% B = 2,
% Ls = [_] ;
% A = 2,
% B = 4,
% Ls = [_, _] ;
% A = 3,
% B = 6,
% Ls = [_, _, _] .

% % check against declarative properties
% ?- wrong_list_length(Ls, N), wrong_list_length([_|Ls], N1), N1 #\= N + 1.
% Ls = [],
% N = 0,
% N1 = 2 ;
% Ls = [_],
% N = 2,
% N1 = 4 ;
% Ls = [_, _],
% N = 4,
% N1 = 6 .

% % check against simplest properties
% ?- wrong_list_length([], 0).
% true.

% ?- wrong_list_length([_], 1).
% false.

correct_list_length([], 0).
correct_list_length([_|Ls], N) :-
  N #> 0,
  N #= N0 + 1,
  correct_list_length(Ls, N0).

% ?- correct_list_length([], N).
% N = 0.

% ?- correct_list_length([a], N).
% N = 1.

% ?- correct_list_length([a,b], N).
% N = 2.

% ?- correct_list_length(Ls, _).
% Ls = [] ;
% Ls = [_] ;
% Ls = [_, _] .

% ?- correct_list_length(Ls, L), false.
% ^CAction (h for help) ? abort
% % Execution Aborted
% ?- maplist(=(a), Ls), \+ correct_list_length(Ls, _).
% ^CAction (h for help) ? abort
% % Execution Aborted
% ?- maplist(=(_), Ls), \+ correct_list_length(Ls, _).
% ^CAction (h for help) ? abort
% % Execution Aborted
% ?- A #\= B, length(Ls, A), correct_list_length(Ls, B).
% ^CAction (h for help) ? abort
% % Execution Aborted
% ?- correct_list_length(Ls, N), correct_list_length([_|Ls], N1), N1 #\= N + 1.
% ^CAction (h for help) ? abort
% % Execution Aborted
% ?- correct_list_length([], 0).
% true.

% ?- correct_list_length([_], 1).
% true.