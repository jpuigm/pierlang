* Exception being raised. It might be a limitation on the floating point.

```erlang
(pierlang-release@127.0.0.1)3> pi_master:new_session(10000000).
00:13:39.218 [info] Starting new session with N = 10000000
** exception error: an error occurred when evaluating an arithmetic expression
     in function  pi_master:pi_formula/2 (src/pi_master.erl, line 48)
     in call from pi_master:new_session/1 (src/pi_master.erl, line 30)
```