## pierlang 

Calculation of Pi Using the Monte Carlo Method

### Usage

```erlang
(pierlang-release@127.0.0.1)20> pi_master:new_session(1000000).
00:09:28.578 [info] Starting new session with N = 1000000
00:09:28.815 [info] Estimation of pi number : 3.14238
ok
```


### Debug

Set lager to print the console debug messages,

```erlang
lager:set_loglevel(lager_console_backend, debug).
```

### Live server in Heroku

Before being able to push to Heroku, we will have to tell Heroku Toolbelt to use the [Erlang buildpack](https://github.com/archaelus/heroku-buildpack-erlang).
