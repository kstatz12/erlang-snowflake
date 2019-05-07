-module(id).
-export([gen/0]).

gen()->
    TimeStamp = os:timestamp(),
    Node = node(),
    Sequence = sequence_server:next(),
    Str = combine([TimeStamp, Node, Sequence]),
    hash(Str).


    
combine(L) when is_list(L) ->
    StrL = lists:map(fun(X) -> str:to_string(X) end, L),
    lists:flatten([StrL]);
combine(_) ->
    {error, "No List Supplied"}.

hash(N) ->
    <<X:256/big-unsigned-integer>> = crypto:hash(sha256,N),
    lists:flatten(io_lib:format("~64.16.0b", [X])).

%% ===================================================================
%% EUnit tests
%% ===================================================================
-ifdef(TEST).

combine_combies() ->
    R = combine(["Hello", "World"]),
    true = R = "HelloWorld".

-endif.
