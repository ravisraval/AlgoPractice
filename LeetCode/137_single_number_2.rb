# Given an array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    nh = Hash.new(0)
    nums.each do |num|
        if nh[num] == 2
            nh.delete(num)
        else
            nh[num] += 1
        end
    end
    nh.keys.first
end
