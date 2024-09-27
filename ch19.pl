f(X, Y) :- g(X), h(Y).
% ?- write_canonical( (f(X, Y) :- g(X), h(Y)) ).
% :-(f(A,B),','(g(A),h(B)))
% true.

:- use_module(library(clpfd)).

integer_successor(I0, I) :- I #= I0 + 1.
% ?- listing(integer_successor/2).
% integer_successor(I0, I) :-
%     (   integer(I)
%     ->  (   integer(I0)
%         ->  I=:=I0+1
%         ;   A=I,
%             clpfd:clpfd_equal(A, I0+1)
%         )
%     ;   integer(I0)
%     ->  (   var(I)
%         ->  I is I0+1
%         ;   A is I0+1,
%             clpfd:clpfd_equal(I, A)
%         )
%     ;   clpfd:clpfd_equal(I, I0+1)
%     ).

% true.