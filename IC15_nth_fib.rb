# Write a function fib() that a takes an integer nn and returns the nnth fibonacci ↴ number.
# Let's say our fibonacci series is 0-indexed and starts with 0.
def nth_fib(n)
  return 0 if n == 0
  return 1 if n == 1
  fibs = [0,1]
  until fibs.length == n + 1
    fibs.push(fibs[-1] + fibs[-2])
  end
  fibs.last
end




p nth_fib(0)
p nth_fib(1)
p nth_fib(2)
p nth_fib(3)
p nth_fib(4)
p nth_fib(5)
p nth_fib(6)
p nth_fib(7)
