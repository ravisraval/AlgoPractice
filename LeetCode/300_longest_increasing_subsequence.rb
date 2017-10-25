# Given an unsorted array of integers, find the length of longest increasing subsequence.
#
# For example,
# Given [10, 9, 2, 5, 3, 7, 101, 18],
# The longest increasing subsequence is [2, 3, 7, 101], therefore the length is 4. Note that there may be more than one LIS combination, it is only necessary for you to return the length.
#
# Your algorithm should run in O(n2) complexity.
#
# Follow up: Could you improve it to O(n log n) time complexity?

# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  current_longest = 0
  current_length = 0

  sorted = nums.map.with_index { |el, idx| [el, idx]}.sort

  sorted.each_with_index do |arr, arridx|
    num, idx = arr

    current_length = sorted[arridx + 1..-1].select { |arr2| arr2[0] > num && arr2[1] > idx}.length
    current_longest = current_length if current_longest > current_length
  end

  current_longest
end
