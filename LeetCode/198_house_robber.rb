# You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
#
# Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

def recur_rob(nums)
  return 0 if nums.empty?
  return [rob(nums[0..-2]), rob(nums[0..-3]) + nums.last].max

end

#below is accepted, above isn't
def iter_rob(nums)
  prev, now = 0, 0
  idx = 0
  while idx < nums.length
    prev, now = now, [prev + nums[idx], now].max
    idx += 1
  end
  now
end
p iter_rob([1,5,9,1,4])

# t(1)
# prev = 0
# now = 1
#
# t(2) which is bigger, prev + 5, or now
# prev = old_now = 1
# now = 5
#
# t(3) which is bigger, prev + 9, or now
# prev = 5
# now = 10
#
# t(4) which is bigger, prev + 1, or now
# prev = 10
# now = 10
