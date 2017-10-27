# Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
# Solve it without division and in O(n).
#
# For example, given [1,2,3,4], return [24,12,8,6].
#
# Follow up:
# Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  if nums.count(0) > 1
    output = Array.new(nums.size, 0)
    output
  elsif nums.count(0) == 1
    bad_idx = nums.index(0)
    output = Array.new(nums.size, 0)
    output[bad_idx] = (nums[0...bad_idx] + nums[bad_idx + 1..-1]).reduce(:*)
    output
  else
    prod = nums.reduce(:*)
    nums.map { |num| prod / num }
  end
end
