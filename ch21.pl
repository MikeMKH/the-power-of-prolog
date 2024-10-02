animal1(dog)  :- is_true("has fur"), is_true("says ee ee").
animal1(cat)  :- is_true("has fur"), is_true("says meow").
animal1(duck) :- is_true("has feathers"), is_true("says quack").

is_true(Q) :-
  format("~s?\n", [Q]),
  read(yes).

% ?- animal1(A).
% has fur?
% |: yes.
% says ee ee?
% |: yes.

% A = dog .

% ?- animal1(A).
% has fur?
% |: yes.
% says ee ee?
% |: no.
% has fur?
% |: yes.
% says meow?
% |: yes.

% A = cat .

animals2([animal2(dog, [is_true("has fur"), is_true("says woof")]),
          animal2(cat, [is_true("has fur"), is_true("says meow")]),
          animal2(duck, [is_true("has feathers"), is_true("says quack")])]).
animal2(A) :-
  animals2(As),
  member(animal2(A,Cs), As),
  maplist(call, Cs).

% ?- animal2(A).
% has fur?
% |: yes.
% says woof?
% |: no.
% has fur?
% |: yes.
% says meow?
% |: no.
% has feathers?
% |: yes.
% says quack?
% |: yes.

% A = duck.

% start from: https://www.complang.tuwien.ac.at/ulrich/Prolog-inedit/swi/reif.pl

if_(If_1, Then_0, Else_0) :-
  call(If_1, T),
  (  T == true -> Then_0
  ;  T == false -> Else_0
  ;  nonvar(T) -> throw(error(type_error(boolean,T),
                              type_error(call(If_1,T),2,boolean,T)))
  ;  throw(error(instantiation_error,instantiation_error(call(If_1,T),2)))
  ).


tfilter(C_2, Es, Fs) :-
  i_tfilter(Es, C_2, Fs).

i_tfilter([], _, []).
i_tfilter([E|Es], C_2, Fs0) :-
  if_(call(C_2, E), Fs0 = [E|Fs], Fs0 = Fs),
  i_tfilter(Es, C_2, Fs).

=(X, Y, T) :-
  (  X == Y -> T = true
  ;  X \= Y -> T = false
  ;  T = true, X = Y
  ;  T = false,
     dif(X, Y)
  ).

non(true, false).
non(false, true).

dif(X, Y, T) :-
  =(X, Y, NT),
  non(NT, T).

memberd_t(E, Xs, T) :-
  i_memberd_t(Xs, E, T).
 
i_memberd_t([], _, false).
i_memberd_t([X|Xs], E, T) :-
   if_( X = E, T = true, i_memberd_t(Xs, E, T) ).

% end from: https://www.complang.tuwien.ac.at/ulrich/Prolog-inedit/swi/reif.pl

animals([animal(dog, [is_true("has fur"), is_true("says woof")]),
         animal(cat, [is_true("has fur"), is_true("says meow")]),
         animal(duck, [is_true("has feathers"), is_true("says quack")])]).

animal(A) :-
  animals(Animals),
  Known0 = [],
  phrase(any_animal(Animals, A), [Known0], _).

any_animal([Animal|Animals], A) -->
  any_animal_(Animal, Animals, A).

any_animal_(animal(A0, []), Animals, A) -->
  (   { A0 = A }
  ;   any_animal(Animals, A)
  ).
any_animal_(animal(A0, [C|Cs]), Animals, A) -->
  state0_state(Known0, Known),
  { condition_truth(C, T, Known0, Known) },
  next_animal(T, animal(A0,Cs), Animals, A).

next_animal(yes, Animal, Animals, A)  --> any_animal([Animal|Animals], A).
next_animal(no, _, Animals, A)        --> any_animal(Animals, A).

state0_state(S0, S), [S] --> [S0].

condition_truth(is_true(Q), Answer, Known0, Known) :-
  if_(known_(Q,Answer,Known0),
      Known0 = Known,
      ( format("~s?\n", [Q]),
        read(Answer),
        Known = [known(Q,Answer)|Known0])).

known_(What, Answer, Known, Truth) :-
  if_(memberd_t(known(What,yes), Known),
      ( Answer = yes, Truth = true ),
      if_(memberd_t(known(What,no), Known),
          ( Answer = no, Truth = true),
          Truth = false)).

% ?- animal(A).
% has fur?
% |: yes.
% says woof?
% |: no.
% says meow?
% |: yes.
% 
% A = cat .