% ?- ZDD = ( X -> true ; ( Y -> true ; false ) ),
% |    put_attr(X, zdd, ZDD),
% |    put_attr(Y, zdd, ZDD).
% ZDD = (X->true;Y->true;false),
% put_attr(X, zdd, (X->true;Y->true;false)),
% put_attr(Y, zdd, (X->true;Y->true;false)).