:- discontiguous request/3.
:- discontiguous completed/5.

/*Sun Apr  9 23:01:19 2017*/
request(45, 1491771679.213,
         [peer(ip(127,0,0,1)),
          method(get),request_uri('/prolog'),path('/prolog'),
          http_version(1-1),host(localhost),port(3037),
          connection('keep-alive'),upgrade_insecure_requests('1'),
          if_modified_since('Wed, 05 Apr 2017 23:24:08 GMT')]).
completed(45, 0.0009790000000000076, 0, 304, not_modified).
/* even more made up stuff */
request(46, 1491771679.213,
         [peer(ip(127,0,0,1)),
          method(get),request_uri('/prolog'),path('/prolog'),
          http_version(1-1),host(localhost),port(3037),
          connection('keep-alive'),upgrade_insecure_requests('1'),
          if_modified_since('Wed, 05 Apr 2017 23:24:08 GMT')]).
request(47, 1491771679.213,
         [peer(ip(127,0,0,1)),
          method(get),request_uri('/prolog'),path('/prolog'),
          http_version(1-1),host(localhost),port(3037),
          connection('keep-alive'),upgrade_insecure_requests('1'),
          if_modified_since('Wed, 05 Apr 2017 23:24:08 GMT')]).
completed(46, 0.0009790000000000076, 0, 304, not_modified).

% ?- request(R, _, _), \+ completed(R, _, _, _, _).
% R = 47.

:- set_prolog_flag(double_quotes, chars).
:- use_module(library(clpfd)).

year_month_days(2017, jan, 31).
year_month_days(2017, feb, 28).
year_month_days(2017, mar, 31).

year_month_daily_visitors(2017, jan, 30018).
year_month_daily_visitors(2017, feb, 32913).
year_month_daily_visitors(2017, mar, 35871).

year_month_total(Year, Month, Total) :-
  Total #= Days*Daily,
  year_month_days(Year, Month, Days),
  year_month_daily_visitors(Year, Month, Daily).

% ?- year_month_total(Year, Month, Total).
% Year = 2017,
% Month = jan,
% Total = 930558 ;
% Year = 2017,
% Month = feb,
% Total = 921564 ;
% Year = 2017,
% Month = mar,
% Total = 1112001.

% ?- format("year month  visitors~n", []),
% |    year_month_total(Year, Month, Total),
% |    format("~w ~w ~t~w~20|~n", [Year,Month,Total]),
% |    false.
% year month  visitors
% 2017 jan      930558
% 2017 feb      921564
% 2017 mar     1112001
% false.

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

% end from: https://www.complang.tuwien.ac.at/ulrich/Prolog-inedit/swi/reif.pl

cumulative(Pred, Until, C) :-
  months(Ms),
  cumulative_(Ms, Pred, Until, 0, C).

cumulative_([], _, _, C, C).
cumulative_([M|Ms], Pred, Until, C0, C) :-
  C1 #= C0 + Current,
  call(Pred, M, Current),
  if_(M=Until, C=C1, cumulative_(Ms, Pred, Until, C1, C)).

months([jan,feb,mar,apr,may,jun,jul,aug,sept,oct,nov,dec]).

% ?- cumulative(year_month_total(2017), M, C).
% M = jan,
% C = 930558 ;
% M = feb,
% C = 1852122 ;
% M = mar,
% C = 2964123 ;
% false.

% ?- cumulative(year_month_total(2017), feb, C).
% C = 1852122.