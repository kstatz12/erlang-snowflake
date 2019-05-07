%%%-------------------------------------------------------------------
%% @doc snowflake public API
%% @end
%%%-------------------------------------------------------------------

-module(snowflake_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    sequence_server:start_link(),
    crypto:start(),
    snowflake_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================