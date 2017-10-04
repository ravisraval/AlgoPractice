# Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
#
# Note: The solution set must not contain duplicate triplets.
#
# For example, given array S = [-1, 0, 1, 2, -1, -4],
#
# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]


def brute(nums)
  res = []
  nums.each_with_index do |num, idx|
    nums.each_with_index do |num2, idx2|
      nums.each_with_index do |num3, idx3|
        next unless idx < idx2 && idx2 < idx3

        current_sum = [num, num2, num3].sort
        if current_sum.reduce(:+) == 0
          res.push(current_sum) unless res.include?(current_sum)
        end
      end
    end
  end
  res
end


#treat this like 2 sum, where the target is whatever thing you're on
require 'set'
def two_sum_helper(nums_slice, target)
  seen_nums = Set.new

  nums_slice.each do |num|
    if seen_nums.include?(target - num)
      return [target - num, num]
    else
      seen_nums << num
    end
  end
end


def better(nums)
  res = []
  nums.each_with_index do |num, idx|
    nums_slice = nums[0...idx] + nums[idx + 1..-1]
    current_num_works = two_sum_helper(nums_slice, num * -1)

    if current_num_works
      current_num_works.push(num)
      res.push(current_num_works.sort) unless res.include?(current_num_works)
    end
  end
  res
end


p two_sum_helper([5,-5,2], -3)
