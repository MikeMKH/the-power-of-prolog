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