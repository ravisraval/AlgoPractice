# Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.
#
# For example:
#
# Given nums = [1, 2, 1, 3, 2, 5], return [3, 5].

# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
    nh = Hash.new(0)
    nums.each do |num|
        if nh[num] == 1
            nh.delete(num)
        else
            nh[num] = 1
        end
    end
    nh.keys
end
