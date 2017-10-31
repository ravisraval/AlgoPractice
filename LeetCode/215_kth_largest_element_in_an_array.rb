# Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
#
# For example,
# Given [3,2,1,5,6,4] and k = 2, return 5.
#
# Note:
# You may assume k is always valid, 1 ≤ k ≤ array's length.


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  top = []
  top_min = nil

  nums.each do |num|
    if top.length < k
      top.push(num)

      if top_min
        top_min = [top_min, num].min
      else
        top_min = num
      end

    else
      if num > top_min
        idx = 0
        until top[idx] == top_min
          idx += 1
        end

        top[idx] = num
        top_min = top.min
      end
    end
  end
  top_min
end

p find_kth_largest([1,2,3,4,5,6], 3)
