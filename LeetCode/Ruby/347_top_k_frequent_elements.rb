# Given a non-empty array of integers, return the k most frequent elements.
#
# For example,
# Given [1,1,1,2,2,3] and k = 2, return [1,2].
#
# Note:
# You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
# Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  hsh = Hash.new(0)
  nums.each do |num|
    hsh[num] += 1
  end

  hsh = hsh.sort_by { |k, v| v}[-k..-1]
  hsh.to_a.map { |pair| pair[0]}
end
