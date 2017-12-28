def nth_fib(n, memo = [0, 1])
  return memo[n - 1] if memo[n - 1]
  memo.push(memo[-1] + memo[-2])
  nth_fib(n, memo)
end

1.upto(15).each do |n|
  p nth_fib(n)
end
