# Given an array consists of non-negative integers, your task is to count the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.
#
# Example 1:
# Input: [2,2,3,4]
# Output: 3
# Explanation:
# Valid combinations are:
# 2,3,4 (using the first 2)
# 2,3,4 (using the second 2)
# 2,2,3
# Note:
# The length of the given array won't exceed 1000.
# The integers in the given array are in the range of [0, 1000].
def brute(nums)
  count = 0
  nums.each_with_index do |num1, idx1|
    nums.each_with_index do |num2, idx2|
      nums.each_with_index do |num3, idx3|
        next unless idx1 < idx2 && idx2 < idx3
        high_target = num1 + num2 - 1
        low_target = (num2 - num1).abs + 1
        count += 1 if num3.between?(low_target, high_target)
      end
    end
  end
  count
end

def triangle_number(nums)
  count = 0

  num_hash = Hash.new { |h,k| h[k] = [] }
  seen_combos = []

  nums.each_with_index do |num, idx|
    num_hash[num].push(idx)
  end

  nums.each_with_index do |num1, idx1|
    nums.each_with_index do |num2, idx2|
      next unless idx1 < idx2
      low_target = (num2 - num1).abs + 1
      high_target = num1 + num2 - 1

      low_target.upto(high_target).each do |target|
        num_hash[target].each do |target_idx|
          next if target_idx == idx1 || target_idx == idx2

          new_combo = [idx1, idx2, target_idx].sort
          unless seen_combos.include?(new_combo)
            seen_combos.push(new_combo)
            count += 1
          end

        end
      end

    end
  end
  return "count", count
end

def helper_2_sum(nums_slice, low_target, high_target)
  num_hash = {}
  # nums_slice.each do |num|
    # num_hash[num] = true

    # low_target.upto(high_target).each do |target|

end

arr = [2,2,3,4]
# p triangle_number(arr)

def benchmark(&prc)
  a = Time.now
  10000.times { prc.call }
  puts Time.now - a
end
benchmark { triangle_number(arr)}
benchmark { brute(arr) }
