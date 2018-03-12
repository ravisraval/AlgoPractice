# Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
#
# You may assume that the array is non-empty and the majority element always exist in the array.
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    count = Hash.new(0)
    nums.each do |num|
        count[num] += 1
        return num if count[num] > nums.length / 2
    end
end
