# A peak element is an element that is greater than its neighbors.
#
# Given an input array where num[i] ≠ num[i+1], find a peak element and return its index.
#
# The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
#
# You may imagine that num[-1] = num[n] = -∞.
#
# For example, in array [1, 2, 3, 1], 3 is a peak element and your function should return the index number 2.
#

def find_peak_element(nums)
  return 0 if nums.length == 1
  prev2 = -Float::INFINITY
  prev = nums[0]
  nums.each_with_index do |num, idx|
    next if idx == 0
    next unless prev > prev2
    return idx - 1 if prev > num
    prev2 = prev
    prev = num
  end
  return nums.length - 1 if prev > prev2
  return "no peaks"
end
