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

/*
Cryptoarithmetic puzzles
      CP
+     IS      
+    FUN
--------
=   TRUE  
*/

:- use_module(library(clpfd)).

digits_number(Ds, N) :-
  length(Ds, _),
  Ds ins 0..9,
  reverse(Ds, RDs),
  foldl(pow, RDs, 0-0, N-_).

pow(D, N0-I0, N-I) :-
  N #= N0 + D*10^I0,
  I #= I0 + 1.

% ?- digits_number([C,P], CP),
% |    digits_number([I,S], IS),
% |    digits_number([F,U,N], FUN),
% |    digits_number([T,R,U,E], TRUE),
% |    CP + IS + FUN #= TRUE,
% |    Vs = [C,P,I,S,F,U,N,T,R,E],
% |    all_distinct(Vs),
% |    label(Vs).
% C = 1,
% P = 2,
% CP = 12,
% I = 8,
% S = 3,
% IS = 83,
% F = 5,
% U = 7,
% N = 9,
% FUN = 579,
% T = 0,
% R = 6,
% E = 4,
% TRUE = 674,
% Vs = [1, 2, 8, 3, 5, 7, 9, 0, 6|...] ;
% C = 1,
% P = 2,
% CP = 12,
% I = 8,
% S = 3,
% IS = 83,
% F = 6,
% U = 5,
% N = 9,
% FUN = 659,
% T = 0,
% R = 7,
% E = 4,
% TRUE = 754,
% Vs = [1, 2, 8, 3, 6, 5, 9, 0, 7|...] . % and so on...

% ?- digits_number([C,P], CP),
% |    digits_number([I,S], IS),
% |    digits_number([F,U,N], FUN),
% |    digits_number([T,R,U,E], TRUE),
% |    T #\= 0,
% |    CP + IS + FUN #= TRUE,
% |    Vs = [C,P,I,S,F,U,N,T,R,E],
% |    all_distinct(Vs),
% |    label(Vs).
% C = 2,
% P = 3,
% CP = 23,
% I = 7,
% S = 4,
% IS = 74,
% F = 9,
% U = 6,
% N = 8,
% FUN = 968,
% T = 1,
% R = 0,
% E = 5,
% TRUE = 1065,
% Vs = [2, 3, 7, 4, 9, 6, 8, 1, 0|...] . % and so on...

/*
     SUN      
+    FUN
--------
=   SWIM  
*/

% ?- digits_number([F,U,N], FUN),
% |    digits_number([S,U,N], SUN),
% |    digits_number([S,W,I,M], SWIM),
% |    S #\= 0, FUN + SUN #= SWIM,
% |    Vs = [F,U,N,S,W,I,M],
% |    all_distinct(Vs), label(Vs).
% F = 8,
% U = 6,
% N = 7,
% FUN = 867,
% S = 1,
% SUN = 167,
% W = 0,
% I = 3,
% M = 4,
% SWIM = 1034,
% Vs = [8, 6, 7, 1, 0, 3, 4] ;
% F = 8,
% U = 7,
% N = 3,
% FUN = 873,
% S = 1,
% SUN = 173,
% W = 0,
% I = 4,
% M = 6,
% SWIM = 1046,
% Vs = [8, 7, 3, 1, 0, 4, 6] . % and so on...