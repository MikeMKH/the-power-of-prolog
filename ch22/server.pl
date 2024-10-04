% https://www.swi-prolog.org/pldoc/man?section=httpserver
% swipl server.pl

:- use_module(library(http/http_server)).

:- initialization http_server([port(8080)]).

:- http_handler(root(.), http_redirect(moved, location_by_id(home_page)), []).
:- http_handler(root(home), home_page, []).

home_page(_Request) :-
  reply_html_page(
    title('Demo server'),
    [ h1('Hello world!')
    ]).

% ?- use_module(library(http/http_client)).
% true.

% ?- http_get('http://localhost:8080/', Page, []).
% Page = '<!DOCTYPE html>\n<html>\n<head>\n<title>Demo server</title>\n\n<meta http-equiv="content-type" content="text/html; charset=UTF-8">\n\n</head>\n<body>\n\n<h1>Hello world!</h1>\n\n</body>\n</html>\n'.
