# Given an array of integers, every element appears twice except for one. Find that single one.
#
# Note:
# Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

# @param {Integer[]} nums
# @return {Integer}
#normal, using hash
def single_number(nums)
  num_hash = {}
  nums.each do |num|
    if num_hash.has_key?(num)
      num_hash.delete(num)
    else
      num_hash[num] = true
    end
  end
  num_hash.keys.first
end


#without extra space..

def single_number(nums)
  nums.inject(&:^)
end
