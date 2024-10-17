:- use_module(library(clpfd)).

% ?- length(_, E), L #= 2^E, portray_clause(L), length(Ls, L), false.
% 1.
% 2.
% 4.
% 8.
% 16.
% 32.
% 64.
% 128.
% 256.
% 512.
% 1024.
% 2048.
% 4096.
% 8192.
% 16384.
% 32768.
% 65536.
% 131072.
% 262144.
% 524288.
% 1048576.
% 2097152.
% 4194304.
% 8388608.
% 16777216.
% 33554432.
% ERROR: Stack limit (1.0Gb) exceeded
% ERROR:   Stack sizes: local: 2Kb, global: 0.3Gb, trail: 1Kb
% ERROR:   Stack depth: 14, last-call: 21%, Choice points: 5
% ERROR:   In:
% ERROR:     [14] system:'$length'(_93851140, 33554432)
% ERROR:     [12] system:'<meta-call>'(<compound (:)/2>)
% ERROR:     [11] '$toplevel':toplevel_call(<compound (:)/2>)
% ERROR:     [10] '$toplevel':stop_backtrace(<compound (:)/2>, _93851210)
% ERROR:     [9] '$tabling':'$wfs_call'(<compound (:)/2>, <compound (:)/2>)
% ERROR: 
% ERROR: Use the --stack_limit=size[KMG] command line option or
% ERROR: ?- set_prolog_flag(stack_limit, 2_147_483_648). to double the limit.
% ^  Exception: (4) setup_call_cleanup('$toplevel':notrace(call_repl_loop_hook(begin, 0)), '$toplevel':'$query_loop'(0), '$toplevel':notrace(call_repl_loop_hook(end, 0))) ? abort
% % Execution Aborted