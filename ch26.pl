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

/*
Which answer is correct?

1. All of the below.
2. None of the below.
3. All of the above.
4. At least one of the above.
5. None of the above.
6. None of the above.
*/

% ?- sat(A1 =:= A2 * A3 * A4 * A5 * A6),
% |    sat(A2 =:= ~A3 * ~A4 * ~A5 * ~A6),
% |    sat(A3 =:= A1 * A2),
% |    sat(A4 =:= A1 + A2 + A3),
% |    sat(A5 =:= ~A1 * ~A2 * ~A3 * ~A4),
% |    sat(A6 =:= ~A1 * ~A2 * ~A3 * ~A4 * ~A5).
% A1 = A2, A2 = A3, A3 = A4, A4 = A6, A6 = 0,
% A5 = 1.

/*
Lewis Carroll

1. None of the unnoticed things, met with at sea, are mermaids.
2. Things entered in the log, as met with at sea, are sure to be worth remembering.
3. I have never met with anything worth remembering, when on a voyage.
4. Things met with at sea, that are noticed, are sure to be recorded in the log.
*/

/*
N	it is noticed
M	it is a mermaid
L	it is entered in the log
R	it is worth remembering
I	I have seen it
*/

sea([N,M,L,R,I]) :-
  sat(M =< N),   % 1. None of the unnoticed things, met with at sea, are mermaids.
  sat(L =< R),   % 2. Things entered in the log, as met with at sea, are sure to be worth remembering.
  sat(I =< ~R),  % 3. I have never met with anything worth remembering, when on a voyage.
  sat(N =< L).   % 4. Things met with at sea, that are noticed, are sure to be recorded in the log.

implication_chain([], Prev) --> [Prev].
implication_chain(Vs0, Prev) --> [Prev],
  { select(V, Vs0, Vs) },
  ( { taut(Prev =< V, 1)  } -> implication_chain(Vs, V)
  ; { taut(Prev =< ~V, 1) } -> implication_chain(Vs, ~V)
  ).

  % ?- sea(Vs),
  % |    Vs = [N,M,L,R,I],
  % |    select(Start, Vs, Rest),
  % |    phrase(implication_chain(Rest, Start), Cs).
  % Vs = [N, Start, L, R, I],
  % M = Start,
  % Rest = [N, L, R, I],
  % Cs = [Start, N, L, R, ~I],
  % sat(1#R*I),
  % sat(Start=:=Start*N),
  % sat(N=:=N*L),
  % sat(L=:=L*R) ;
  
  % Vs = [N, M, L, R, Start],
  % I = Start,
  % Rest = [N, M, L, R],
  % Cs = [Start, ~R, ~L, ~N, ~M],
  % sat(1#R*Start),
  % sat(M=:=M*N),
  % sat(N=:=N*L),
  % sat(L=:=L*R) ;
  
  % false.