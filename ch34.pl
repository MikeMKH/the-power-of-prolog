% taken from https://www.metalevel.at/prolog/showcases/turing.pl
:- use_module(library(lists)).

turing(Name, Tape0, Tape) :-
        phrase(turing_(s(q0), Name), [[]-Tape0], [Ls-Rs]),
        reverse(Ls, Ls1),
        append(Ls1, Rs, Tape).

state(S0, S), [S] --> [S0].

turing_(final, _) --> [].
turing_(s(Q0), Name) -->
        state(Ls0-Rs0, Ls-Rs),
        { right_symbol_rest(Rs0, Symbol0, RsRest),
          tm(Name, Q0, Symbol0, Q, Symbol, Action),
          action(Action, Ls0, Ls, [Symbol|RsRest], Rs) },
        turing_(Q, Name).

action(left, Ls0, Ls, Rs0, Rs) :- left(Ls0, Ls, Rs0, Rs).
action(stay, Ls, Ls, Rs, Rs).
action(right, Ls0, [Symbol|Ls0], [Symbol|Rs], Rs).

left([], [], Rs, [b|Rs]).
left([L|Ls], Ls, Rs, [L|Rs]).

right_symbol_rest([], b, []).
right_symbol_rest([Symbol|Rest], Symbol, Rest).

tm(plus1, q0, 1, s(q0), 1, right).
tm(plus1, q0, b, final, 1, stay).

% ?- turing(plus1, [1,1,1], Ts).
% Ts = [1, 1, 1, 1].

% ?- turing(plus1, [], Ts).
% Ts = [1].

% ?- turing(Fn, [], [1]).
% Fn = plus1.

% ?- turing(plus1, In, [1,1]).
% In = [1] ;
% ^CAction (h for help) ? abort
% % Execution Aborted