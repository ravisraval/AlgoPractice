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
# solution incomplete : has issue with 0s?
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
  nil
end


def better(nums)
  res = []
  nums.each_with_index do |num, idx|
    nums_slice = nums[0...idx] + nums[idx + 1..-1]

    current_num_works = two_sum_helper(nums_slice, num * -1)

    if current_num_works
      current_num_works = current_num_works.push(num).sort
      res.push(current_num_works) unless res.include?(current_num_works)
    end
  end
  res
end


p two_sum_helper([5,-5,2], -3)


# @param {Integer[]} nums
# @return {Integer[][]}
# this time, with 100% more sorting! and no extra space! wooo
def three_sum(nums)
    nums.each do |num|
        if nums.count(num) > 3
            nums.delete(num)
            nums.push(num, num, num)
        end
    end
    res = {}
    nums.sort!

    nums.each_with_index do |num, idx|
        mididx = idx + 1
        lastidx = nums.length - 1

        while mididx < lastidx

            current_sum = num + nums[mididx] + nums[lastidx]
            if current_sum == 0
                res[[num, nums[mididx], nums[lastidx]]] = true
                mididx += 1
                lastidx -= 1
            elsif current_sum > 0
                lastidx -= 1
            else
                mididx += 1
            end
        end
    end

    res.keys
end
