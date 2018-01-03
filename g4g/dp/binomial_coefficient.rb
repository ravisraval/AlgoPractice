# Following are common definition of Binomial Coefficients.
# 1) A binomial coefficient C(n, k) can be defined as the coefficient of X^k in the expansion of (1 + X)^n.
#
# 2) A binomial coefficient C(n, k) also gives the number of ways, disregarding order, that k objects can be chosen from among n objects; more formally, the number of k-element subsets (or k-combinations) of an n-element set.
#
# The Problem
# Write a function that takes two parameters n and k and returns the value of Binomial Coefficient C(n, k). For example, your function should return 6 for n = 4 and k = 2, and it should return 10 for n = 5 and k = 2.

def binom(n,k, memo = [[1,1]])
  return memo[n - 1][k] if memo[n - 1]
  new_row = [1]
  prev_row = memo.last
  idx = 0
  while idx < prev_row.length - 1
    new_row.push(prev_row[idx] + prev_row[idx + 1])
    idx += 1
  end
  new_row.push(1)
  memo.push(new_row)
  binom(n, k, memo)
end
p binom(5,2)

def binom_low_space(n, k)
  prev = [1, 1]
  counter = 1

  until counter == n
      new_row = [1]
      idx = 0
      while idx < prev.length - 1
        new_row.push(prev[idx] + prev[idx + 1])
        idx += 1
      end
      new_row.push(1)
      prev = new_row
      counter += 1
  end
  prev[k]
end

p binom_low_space(5,2)
