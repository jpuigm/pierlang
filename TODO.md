# Things planned to do #

* Current issue:

[error] Supervisor pi_sup had child pi_master started with pi_master:start_link() at undefined exit with reason {'EXIT',{undef,[{pi_master,start_link,[],[]},{supervisor,do_start_child,2,[{file,"supervisor.erl"},{line,310}]},{supervisor,start_children,3,[{file,"supervisor.erl"},{line,293}]},{supervisor,init_children,2,[{file,"supervisor.erl"},{line,259}]},{gen_server,init_it,6,[{file,"gen_server.erl"},{line,304}]},{proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,239}]}]}} in context start_error
(pierlang@127.0.0.1)1> 00:27:59.640 [error] CRASH REPORT Process <0.508.0> with 0 neighbours exited with reason: {{shutdown,{failed_to_start_child,pi_master,{'EXIT',{undef,[{pi_master,start_link,[],[]},{supervisor,do_start_child,2,[{file,"supervisor.erl"},{line,310}]},{supervisor,start_children,3,[{file,"supervisor.erl"},{line,293}]},{supervisor,init_children,2,[{file,"supervisor.erl"},{line,259}]},{gen_server,init_it,6,[{file,"gen_server.erl"},{line,304}]},{proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,239}]}]}}}},{pi_app,start,[normal,[]]}} in application_master:init/4 line 133
{"Kernel pid terminated",application_controller,"{application_start_failure,pierlang,{{shutdown,{failed_to_start_child,pi_master,{'EXIT',{undef,[{pi_master,start_link,[],[]},{supervisor,do_start_child,2,[{file,\"supervisor.erl\"},{line,310}]},{supervisor,start_children,3,[{file,\"supervisor.erl\"},{line,293}]},{supervisor,init_children,2,[{file,\"supervisor.erl\"},{line,259}]},{gen_server,init_it,6,[{file,\"gen_server.erl\"},{line,304}]},{proc_lib,init_p_do_apply,3,[{file,\"proc_lib.erl\"},{line,239}]}]}}}},{pi_app,start,[normal,[]]}}}"}

It's a matter of exporting a start_link in pi_master.erl and define N in a config file or somehow differently.

* Generate a release and include app.config with lager settings.
* Static children solution as pool of workers.
* Dynamic children solution.
