% ?- use_module(library(http/http_open)).
% true.

% ?- http_open("https://www.metalevel.at/prolog", Stream, []).
% Stream = <stream>(0x7fd7546dd770).

% ?- http_open("https://www.metalevel.at/prolog", Stream, []),
% |    load_html(stream(Stream), DOM, []).
% Stream = <stream>(0x7fd756b71fa0),
% DOM = [element(html, [], [element(head, [], [element(title, [], ['The Power of Prolog']), element(meta, [name=viewport, ... = ...], []), element(meta, [... = ...|...], []), element(meta, [...|...], []), element(..., ..., ...)]), element(body, [style='padding-left: 5%; padding-right: 5%; padding-bottom: 3cm'], ['\n\n    ', element(br, [], []), element(br, [], []), '\n    '|...])])].

% ?- use_module(library(sgml)),
% |    use_module(library(xpath)).
% true.

% ?- http_open("https://www.metalevel.at/prolog", Stream, []),
% |    load_html(stream(Stream), DOM, []),
% |    xpath(DOM, //li(text), Item).
% Stream = <stream>(0x7fd759432160),
% DOM = [element(html, [], [element(head, [], [element(title, [], ['The Power of Prolog']), element(meta, [name=viewport, ... = ...], []), element(meta, [... = ...|...], []), element(meta, [...|...], []), element(..., ..., ...)]), element(body, [style='padding-left: 5%; padding-right: 5%; padding-bottom: 3cm'], ['\n\n    ', element(br, [], []), element(br, [], []), '\n    '|...])])],
% Item = 'Introduction' ;
% Stream = <stream>(0x7fd759432160),
% DOM = [element(html, [], [element(head, [], [element(title, [], ['The Power of Prolog']), element(meta, [name=viewport, ... = ...], []), element(meta, [... = ...|...], []), element(meta, [...|...], []), element(..., ..., ...)]), element(body, [style='padding-left: 5%; padding-right: 5%; padding-bottom: 3cm'], ['\n\n    ', element(br, [], []), element(br, [], []), '\n    '|...])])],
% Item = 'Facets of Prolog' ;
% Stream = <stream>(0x7fd759432160),
% DOM = [element(html, [], [element(head, [], [element(title, [], ['The Power of Prolog']), element(meta, [name=viewport, ... = ...], []), element(meta, [... = ...|...], []), element(meta, [...|...], []), element(..., ..., ...)]), element(body, [style='padding-left: 5%; padding-right: 5%; padding-bottom: 3cm'], ['\n\n    ', element(br, [], []), element(br, [], []), '\n    '|...])])],
% Item = 'Logical Foundations' ;
% Stream = <stream>(0x7fd759432160),
% DOM = [element(html, [], [element(head, [], [element(title, [], ['The Power of Prolog']), element(meta, [name=viewport, ... = ...], []), element(meta, [... = ...|...], []), element(meta, [...|...], []), element(..., ..., ...)]), element(body, [style='padding-left: 5%; padding-right: 5%; padding-bottom: 3cm'], ['\n\n    ', element(br, [], []), element(br, [], []), '\n    '|...])])],
% Item = 'Basic Concepts' ;
% Stream = <stream>(0x7fd759432160),
% DOM = [element(html, [], [element(head, [], [element(title, [], ['The Power of Prolog']), element(meta, [name=viewport, ... = ...], []), element(meta, [... = ...|...], []), element(meta, [...|...], []), element(..., ..., ...)]), element(body, [style='padding-left: 5%; padding-right: 5%; padding-bottom: 3cm'], ['\n\n    ', element(br, [], []), element(br, [], []), '\n    '|...])])],
% Item = 'Data Structures' ;
% Stream = <stream>(0x7fd759432160),
% DOM = [element(html, [], [element(head, [], [element(title, [], ['The Power of Prolog']), element(meta, [name=viewport, ... = ...], []), element(meta, [... = ...|...], []), element(meta, [...|...], []), element(..., ..., ...)]), element(body, [style='padding-left: 5%; padding-right: 5%; padding-bottom: 3cm'], ['\n\n    ', element(br, [], []), element(br, [], []), '\n    '|...])])],
% Item = 'Reading Prolog Programs' . % and so on...