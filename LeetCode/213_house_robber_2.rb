# After robbing those houses on that street, the thief has found himself a new place for his thievery so that he will not get too much attention. This time, all houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, the security system for these houses remain the same as for those in the previous street.
#
# Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

def iter_rob(nums)
  return 0 unless nums.is_a? Array
  prev, now = 0, 0
  idx = 0
  while idx < nums.length
    prev, now = now, [prev + nums[idx], now].max
    idx += 1
  end
  now
end

def rob(nums)
  return nums[0] if nums.length == 1
  [iter_rob(nums[1..-1]), iter_rob(nums[0..-2])].max
end
