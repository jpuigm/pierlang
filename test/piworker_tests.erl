-module(piworker_tests).

-include_lib("eunit/include/eunit.hrl").

piworker_test_() ->
    {setup,
     fun() ->
             ?assertEqual(ok, meck:new(random, [unstick])),
             ok
     end,
     fun(_) ->
             ?assertEqual(ok, meck:unload(random)),
             ok
     end,
     [
      {"pin falls within the circle",
       fun() ->
               ?assertEqual(ok, meck:expect(random, uniform, 0, 0.7)), %% 0.7^2 = 0.48999999999999994
               ?assert(piworker:pin_the_square()),
               ?assert(meck:validate(random))
       end},
      {"pin falls outside the circle",
       fun() ->
               ?assertEqual(ok, meck:expect(random, uniform, 0, 0.8)), %% 0.8^2 = 0.6400000000000001
               ?assertNot(piworker:pin_the_square()),
               ?assert(meck:validate(random))
       end},
      {"experiment pin n times returns c=0",
       fun() ->
               N = 10,
               ?assertEqual(ok, meck:expect(random, uniform, 0, 0.8)), 
               ?assertEqual(0,piworker:pin_the_square(N)),
               ?assert(meck:validate(random))
       end},
      {"experiment pin n times returns c=n",
       fun() ->
               N = 10,
               ?assertEqual(ok, meck:expect(random, uniform, 0, 0.7)), 
               ?assertEqual(N,piworker:pin_the_square(N)),
               ?assert(meck:validate(random))
       end}      
      ]}.
             
