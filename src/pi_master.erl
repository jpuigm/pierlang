%%%-------------------------------------------------------------------
%%% @author Juan Puig Martinez <juan.puig@gmail.com>
%%% @copyright (C) 2014, Juan Puig Martinez
%%% @doc
%%%
%%% @end
%%% Created : 24 Mar 2014 by Juan Puig Martinez <juan.puig@gmail.com>
%%%-------------------------------------------------------------------
-module(pi_master).

-compile([{parse_transform, lager_transform}]).

-export([new_session/1]).

-define(PROCESSES, 5).

%% @doc
%% Creates a new session with N experiments.
%% Uses a default number of processes to work out
%% the final C. Returns estimation of pi number.
-spec new_session(integer()) -> integer().
new_session(N) ->
    lager:info("Starting new session with N = ~p", [N]),
    Np = N div ?PROCESSES,
    lager:debug("P = ~p N = ~p Np = ~p", [?PROCESSES, N, Np]),
    Pids = create_processes(N, Np),
    lager:debug("Pids = ~p", [Pids]),
    C = wait_for_results(length(Pids)),
    lager:debug("C = ~p", [C]),
    Pi = pi_formula(C, N),
    lager:info("Estimation of pi number : ~p", [Pi]).


%% Internal functions

%% @doc
%% C: Coordinates within the target (circle)
%% N: Total number of generated coordinates.
%% C/N: Ratio of coordinates that falls within the target.
%%
%% C/N = Pi*Radio^2/4
%%
%% Given that Radio = 1:
%%
%% Pi = 4*C/N
%% @end
pi_formula(C,N) ->
    4*C/N.

create_processes(Total, Np) ->
    create_processes(Total, Np, []).

create_processes(0, _, Pids) ->
    Pids;
create_processes(Total, Np, Pids) ->
    NewPid = new_process(Np),
    lager:debug("New process ~p has just been created", [NewPid]),
    create_processes(Total-1, Np, [NewPid | Pids]).

new_process(Np) ->
    {ok, Pid} = pi_spawn:spawn_process(self(), Np),
    Pid.

wait_for_results(N) ->
    wait_for_results(N, 0).

wait_for_results(0, C) ->
    C;
wait_for_results(N, C) ->
    receive
        {c, NewC, From} ->
            lager:debug("Cp = ~p from ~p", [NewC, From]),
            wait_for_results(N-1, C+NewC)
    after
        1000 ->
            lager:debug("Timeout..."),
            timeout
    end.
