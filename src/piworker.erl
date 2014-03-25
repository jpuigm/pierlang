%%%-------------------------------------------------------------------
%%% @author Juan Puig Martinez <juan.puig@gmail.com>
%%% @copyright (C) 2014, Juan Puig Martinez
%%% @doc
%%%
%%% @end
%%% Created : 24 Mar 2014 by Juan Puig Martinez <juan.puig@gmail.com>
%%%-------------------------------------------------------------------
-module(piworker).

-compile([{parse_transform, lager_transform}]).

-export([workout/2]).
-export([pin_the_square/0]).
-export([pin_the_square/1]).

workout(Manager, Np) ->
    C = pin_the_square(Np),
    Manager ! {c, C, self()},
    ok.

%% Given Np experiments, returns Cp.
%% For more information, see priv/practica_1_-_presentacion.pdf
-spec pin_the_square(integer()) -> integer().
pin_the_square(Np) ->
    pin_the_square(Np,0).


%%%%%%%%%%%%%
%% Private %%
%%%%%%%%%%%%%

pin_the_square(0, Cp) ->
    Cp;
pin_the_square(Nr, Cp) ->
    case pin_the_square() of
        true ->
            pin_the_square(Nr-1, Cp+1);
        false ->
            pin_the_square(Nr-1, Cp)
    end.

%% Generates a random dot and returns whether
%% it falls under the target area.
-spec pin_the_square() -> boolean().
pin_the_square() ->
    {X,Y} = {random:uniform(), random:uniform()},
    X*X + Y*Y =< 1.



            
        

    
    

