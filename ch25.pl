pl_resolution(Clauses0, Chain) :-
  maplist(sort, Clauses0, Clauses), % remove duplicates
  length(Chain, _),
  pl_derive_empty_clause(Chain, Clauses).

pl_derive_empty_clause([], Clauses) :-
  member([], Clauses).
pl_derive_empty_clause([C|Cs], Clauses) :-
  pl_resolvent(C, Clauses, Rs),
  pl_derive_empty_clause(Cs, [Rs|Clauses]).

pl_resolvent((As0-Bs0) --> Rs, Clauses, Rs) :-
  member(As0, Clauses),
  member(Bs0, Clauses),
  select(Q, As0, As),
  select(not(Q), Bs0, Bs),
  append(As, Bs, Rs0),
  sort(Rs0, Rs), % remove duplicates
  maplist(dif(Rs), Clauses).

% ?- Clauses = [[p,not(q)], [not(p),not(s)], [s,not(q)], [q]],
% |    pl_resolution(Clauses, Rs),
% |    maplist(portray_clause, Rs).
% [p, not(q)]-[not(p), not(s)] -->
%     [not(q), not(s)].
% [s, not(q)]-[not(q), not(s)] -->
%     [not(q)].
% [q]-[not(q)] -->
%     [].
% Clauses = [[p, not(q)], [not(p), not(s)], [s, not(q)], [q]],
% Rs = [([p, not(q)]-[not(p), not(s)]-->[not(q), not(s)]), ([s, not(q)]-[not(q), not(s)]-->[not(q)]), ([q]-[not(q)]-->[])] ;
% [s, not(q)]-[not(p), not(s)] -->
%     [not(p), not(q)].
% [p, not(q)]-[not(p), not(q)] -->
%     [not(q)].
% [q]-[not(q)] -->
%     [].
% Clauses = [[p, not(q)], [not(p), not(s)], [s, not(q)], [q]],
% Rs = [([s, not(q)]-[not(p), not(s)]-->[not(p), not(q)]), ([p, not(q)]-[not(p), not(q)]-->[not(q)]), ([q]-[not(q)]-->[])] . % and so on...
