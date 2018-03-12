# Given a binary array, find the maximum number of consecutive 1s in this array.
#
# Example 1:
# Input: [1,1,0,1,1,1]
# Output: 3
# Explanation: The first two digits or the last three digits are consecutive 1s.
#     The maximum number of consecutive 1s is 3.
# Note:
#
# The input array will only contain 0 and 1.
# The length of input array is a positive integer and will not exceed 10,000

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
    max_length = 0
    curr_length = 0

    nums.each do |num|
        if num == 1
            curr_length += 1
        else
            curr_length = 0
        end
        max_length = curr_length if curr_length > max_length
    end
    max_length

end
