#memo fib

def memo_fib(n, memo = [0, 1])

  return memo[n] if memo[n]

  memo[n] = memo_fib(n - 1, memo) + memo_fib(n - 2, memo)

  return memo[n]
end


def iter_fib(n)

  memo = [0,1]
  until memo.length == n + 1
    memo.push(memo[-1] + memo[-2])
  end
  memo.last
end

# p memo_fib(1000)
# p iter_fib(1000)

$iter_fib = Proc.new do |n|
  memo = [0,1]
  until memo.length == n + 1
    memo.push(memo[-1] + memo[-2])
  end
  memo.last
end

$dp_fib = Proc.new do |n, memo = [0,1]|
  return memo[n] if memo[n]

  memo[n] = memo_fib(n - 1, memo) + memo_fib(n - 2, memo)

  memo[n]
end

def benchmark(times_to_run, prc)

  a = Time.now

  times_to_run.times do |time|
    prc.call(100)
  end

  Time.now - a
end


# p benchmark(100000, $iter_fib)
# p benchmark(100000, $dp_fib)
