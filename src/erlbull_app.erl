-module(erlbull_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
    application:start(cowboy),

    Dispatch = [{'_', [{'_', eb_http_handler, []}]}],
    cowboy:start_listener(http, 10,
      cowboy_tcp_transport, [{port, 8080}],
      cowboy_http_protocol, [{dispatch, Dispatch}]),

    application:start(erlbull).

start(_StartType, _StartArgs) ->
    erlbull_sup:start_link().

stop(_State) ->
    ok.
