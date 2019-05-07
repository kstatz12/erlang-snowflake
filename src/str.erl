-module(str).

-export([to_string/1]).

to_string(N) when is_atom(N) ->
    atom_to_list(N);
to_string(N) ->
    io_lib:format("~p", [N]).

