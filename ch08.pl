% ?- length(Ls, _).
% Ls = [] ;
% Ls = [_] ;
% Ls = [_, _] ;
% Ls = [_, _, _] ;
% Ls = [_, _, _, _] ;
% Ls = [_, _, _, _, _] .

%% nontermination
% ?- length(_, Ls), Ls = [].
% ^CAction (h for help) ? abort
% % Execution Aborted

% % nontermination
% ?- length(_, Ls), false, Ls = [].
% ^CAction (h for help) ? abort
% % Execution Aborted

% % nontermination
% adjacent(a, b).
% adjacent(e, f).
% adjacent(X, Y) :- adjacent(Y, X).

% ?- adjacent(X, Y).
% X = a,
% Y = b ;
% X = e,
% Y = f ;
% X = b,
% Y = a ;
% X = f,
% Y = e ;
% X = a,
% Y = b ;
% X = e,
% Y = f .

adjacent_(a, b).
adjacent_(e, f).

adjacent(X, Y) :- adjacent_(X, Y).
adjacent(X, Y) :- adjacent_(Y, X).

% ?- adjacent(X, Y).
% X = a,
% Y = b ;
% X = e,
% Y = f ;
% X = b,
% Y = a ;
% X = f,
% Y = e.

% [trace]  ?- adjacent(X, Y).
%    Call: (10) adjacent(_27598, _27600) ? creep
%    Call: (11) adjacent_(_27598, _27600) ? creep
%    Exit: (11) adjacent_(a, b) ? creep
%    Exit: (10) adjacent(a, b) ? creep
% X = a,
% Y = b ;
%    Redo: (11) adjacent_(_27598, _27600) ? creep
%    Exit: (11) adjacent_(e, f) ? creep
%    Exit: (10) adjacent(e, f) ? creep
% X = e,
% Y = f ;
%    Redo: (10) adjacent(_27598, _27600) ? creep
%    Call: (11) adjacent_(_27600, _27598) ? creep
%    Exit: (11) adjacent_(a, b) ? creep
%    Exit: (10) adjacent(b, a) ? creep
% X = b,
% Y = a ;
%    Redo: (11) adjacent_(_27600, _27598) ? creep
%    Exit: (11) adjacent_(e, f) ? creep
%    Exit: (10) adjacent(f, e) ? creep
% X = f,
% Y = e.

%% showing that adjacent/2 now terminates
% ?- adjacent(X, Y), false.
% false.