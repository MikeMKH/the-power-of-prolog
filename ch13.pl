:- use_module(library(clpfd)).

:- op(920,fy, *).

*_. 

wrong_list_length([], 0).
wrong_list_length([_|Ls], N) :-
  N #> 0,
  N #= N0 + 2,
  wrong_list_length(Ls, N0).

% ?- wrong_list_length([_], 1).
% false.

% ?- wrong_list_length([_], 2).
% true.

% wrong_list_length([], 0).
% wrong_list_length([_|Ls], N) :-
%   N #> 0,
%  * N #= N0 + 2,
%   wrong_list_length(Ls, N0).

% % ?- wrong_list_length([_], 1).
% % true.

correct_list_length([], 0).
correct_list_length([_|Ls], N) :-
  N #> 0,
  N #= N0 + 1,
  correct_list_length(Ls, N0).

% ?- wrong_list_length([_], 1).
% false.

% ?- correct_list_length([_], 1).
% true.

% ?- correct_list_length(Ls, L).
% Ls = [],
% L = 0 ;
% Ls = [_],
% L = 1 ;
% Ls = [_, _],
% L = 2 ;
% Ls = [_, _, _],
% L = 3 ;
% Ls = [_, _, _, _],
% L = 4 .