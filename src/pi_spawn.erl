-module(pi_spawn).

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([spawn_process/2]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% @doc Spawns a workout of an asynchronous Cp.
-spec spawn_process(pid(), integer()) -> {ok, pid()}.
spawn_process(Manager, Np) ->
    Pid = erlang:spawn_link(piworker, workout, [Manager, Np]),
    {ok, Pid}.


%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.

