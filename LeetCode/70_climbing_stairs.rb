# You are climbing a stair case. It takes n steps to reach to the top.
#
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
#
# Note: Given n will be a positive integer.

def climb_stairs(n)
  res = [0,1,2,3]

  count = 3
  while count <= n
    res[count] = res[count - 1] + res[count - 2]

    count += 1
  end

  res[n]
end
