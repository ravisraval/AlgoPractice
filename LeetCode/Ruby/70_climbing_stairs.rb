# You are climbing a stair case. It takes n steps to reach to the top.
#
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
#
# Note: Given n will be a positive integer.

def climb_stairs(n)
  return n if n < 3
  res = [0,1,2]
  until res.length >= n + 1
    res.push(res[-1] + res[-2])
  end
  res.last
end
