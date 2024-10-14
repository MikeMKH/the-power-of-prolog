:- use_module(library(clpb)).

% You meet 2 inhabitants, A and B. A says: "Either I am a knave or B is a knight."

% ?- sat(A =:= ~A + B).
% A = B, B = 1.

% A says: "I am a knave, but B isn't."

% ?- sat(A =:= ~A * B).
% A = B, B = 0.

%  A says: "At least one of us is a knave."

% ?- sat(A =:= ~A + ~B).
% A = 1,
% B = 0.

% ?- sat(A =:= card([1,2], [~A,~B])).
% A = 1,
% B = 0.

% You meet 3 inhabitants. A says: "All of us are knaves." B says: "Exactly one of us is a knight."

% ?- sat(A =:= ~A * ~B * ~C), sat(B =:= card([1], [A,B,C])).
% A = C, C = 0,
% B = 1.

% A says: "B is a knave." B says: "A and C are of the same kind." What is C?

% ?- sat(A =:= ~B), sat(B =:= (A =:= C)).
% C = 0,
% sat(A=\=B).