-module(sequence_server).

-behavior(gen_server).

-export([init/1, start_link/0]).
-export([handle_call/3, handle_cast/2]).
-export([next/0, reset/0]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

init(State) ->
    {ok, State}.

start_link() ->
    gen_server:start_link({global, sequence}, sequence_server, 0, []).

next() ->
    gen_server:call({global, sequence}, get_next).

reset() ->
    gen_server:cast({global, sequence}, reset).

handle_call(get_next, _From, State) ->
    case State of
        1024 ->
            {reply, 0, 0};
        _ ->
            NewState = State + 1,
            {reply, NewState, NewState}
    end.

handle_cast(reset, _State) ->
    {noreply, 0}.
        

