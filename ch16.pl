:- dynamic value/1.

update_value(Value) :-
  retractall(value(_)),
  asserta(value(Value)).

get_value(Value) :-
  value(Value).

add_value(Add) :-
  value(Value0),
  Value is Value0 + Add,
  update_value(Value).

% ?- value(R).
% false.

% ?- update_value(8).
% true.

% ?- get_value(8).
% true.

% ?- get_value(R).
% R = 8.

% ?- get_value(9).
% false.

% ?- add_value(3).
% true.

% ?- get_value(R).
% R = 11.

% ?- update_value(1).
% true.

% ?- get_value(R).
% R = 1.

% ?- add_value(-3).
% true.

% ?- get_value(R).
% R = -2.

% ?- value(X).
% X = -2.