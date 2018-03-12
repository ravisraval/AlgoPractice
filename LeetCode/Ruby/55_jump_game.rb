# Given an array of non-negative integers, you are initially positioned at the first index of the array.
#
# Each element in the array represents your maximum jump length at that position.
#
# Determine if you are able to reach the last index.
#
# For example:
# A = [2,3,1,1,4], return true.
#
# A = [3,2,1,0,4], return false.
# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  index_hash = {}
  idx = nums.length - 1
  index_hash[idx] = true

  idx -= 1
  prev = nil
  while idx >= 0
    value = nums[idx]

    if !prev.nil? && value == prev + 1
      index_hash[idx] = index_hash[idx + 1]
      prev = nums[idx]
      idx -= 1
      next
    end

    if value > 0
      1.upto(value).each do |inc|
        if index_hash[idx + inc]
          index_hash[idx] = true
          break
          end
      end
    end

    index_hash[idx] = false unless index_hash[idx]

    prev = nums[idx]
    idx -= 1
  end

  index_hash[0]
end


def can_jump(nums)
    last_valid = nums.length - 1

    (nums.length - 2).downto(1) do |i|
        if nums[i] + i >= last_valid
            last_valid = i
        end
    end
    nums[0] >= last_valid
end
