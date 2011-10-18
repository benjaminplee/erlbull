#!/bin/sh

rebar clean get-deps compile

erl -sname erlbull -pa ebin -pa deps/*/ebin -boot start_sasl -s erlbull_app
