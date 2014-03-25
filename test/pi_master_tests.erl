-module(pi_master_tests).

-include_lib("eunit/include/eunit.hrl").

pi_master_test_() ->
    {setup,
     fun() ->
             ok
     end,
     fun(_) ->
             ok
     end,
     [
      {"new session test",
       fun() ->
               true
       end}
     ]}.
