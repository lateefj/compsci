import timeit

def fast_fib(n, cache={}):
    if n in cache.keys():
        return cache[n]
    if n <= 2:
        return 1
    cache[n] = fast_fib(n-1,cache=cache) + fast_fib(n-2, cache=cache)
    return cache[n]

print(timeit.repeat('for x in (7, 10, 15, 20) : fast_fib(x)', "from __main__ import fast_fib"))

def slow_fib(n):
    if n <=2:
        return 1
    return slow_fib(n-1) + slow_fib(n-2)

print(timeit.repeat('for x in (7, 10, 15, 20) : slow_fib(x)', "from __main__ import slow_fib"))

