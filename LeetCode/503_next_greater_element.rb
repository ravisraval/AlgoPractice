# Given a circular array (the next element of the last element is the first element of the array), print the Next Greater Number for every element. The Next Greater Number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, output -1 for this number.
#
# Example 1:
# Input: [1,2,1]
# Output: [2,-1,2]
# Explanation: The first 1's next greater number is 2;
# The number 2 can't find next greater number;
# The second 1's next greater number needs to search circularly, which is also 2.
# Note: The length of given array won't exceed 10000.

#too slow for one test.. solution with a stack: https://leetcode.com/problems/next-greater-element-ii/solution/
def next_greater_element(nums)
  res = []
  nums.each_with_index do |num, idx|

    pushed = false
    (nums.length - 1).times do |step|
      current_idx = (idx + step + 1) % nums.length

      if nums[current_idx] > num
        res.push(nums[current_idx])
        pushed = true
        break
      end

    end

    res.push(-1) unless pushed
  end

  res
end

input = [1,2,1,4]
p next_greater_element(input)
