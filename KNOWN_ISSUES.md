* Algorithm/formula seems to be wrong. Process generation and termination seems right. 

```
(pierlang-release@127.0.0.1)2> pi_master:new_session(10).
23:29:38.405 [info] Starting new session with N = 10
23:29:38.405 [info] Estimation of pi number : 4.0
ok
(pierlang-release@127.0.0.1)3> pi_master:new_session(100).
23:29:44.660 [info] Starting new session with N = 100
23:29:44.661 [info] Estimation of pi number : 64.0
ok
(pierlang-release@127.0.0.1)4> pi_master:new_session(1000).
23:29:51.680 [info] Starting new session with N = 1000
ok
23:29:51.727 [info] Estimation of pi number : 632.0
(pierlang-release@127.0.0.1)5> pi_master:new_session(10000).
23:29:56.607 [info] Starting new session with N = 10000
ok
(pierlang-release@127.0.0.1)6> 23:30:01.070 [info] Estimation of pi number : 6396.0
```