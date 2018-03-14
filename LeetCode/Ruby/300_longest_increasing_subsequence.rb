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
  longest_len = 0
  longest_arr = []
  curr_arr = []
  nums.each do |num|
    idx = (0...curr_arr.length).bsearch { |i| curr_arr[i] > num } || curr_arr.length
    curr_arr[idx] = num

    if curr_arr.length > longest_len
      longest_len = curr_arr.length
      longest_arr = curr_arr.dup
    end

  end
  
  longest_arr
end

def bs_length_of_lis(nums)
 array = []

  nums.each do |num|
    # search for first idx where array[i] >= num
    idx = (0...array.size).bsearch { |i| array[i] >= num } || array.size
    puts "num: #{num}"
    puts "idx: #{idx}"
    array[idx] = num
    p array
    puts
  end

  array.size
end

p [19,20,9,2,5,3,7,101,18]
# p bs_length_of_lis([19,20,9,2,5,3,7,101,18])
p length_of_lis([19,20,9,2,5,3,7,101,18])
