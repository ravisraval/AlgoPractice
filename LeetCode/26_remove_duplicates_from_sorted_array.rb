# Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
#
# Do not allocate extra space for another array, you must do this in place with constant memory.
#
# For example,
# Given input array nums = [1,1,2],
#
# Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
#
# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    idx = 0
    while idx < nums.length
        if nums[idx] == nums[idx + 1]
            nums.delete_at(idx + 1)
        else
            idx += 1
        end
    end
    nums.length
end
