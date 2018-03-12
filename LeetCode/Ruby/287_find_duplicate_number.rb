# Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.
#
# Note:
# You must not modify the array (assume the array is read only).
# You must use only constant, O(1) extra space.
# Your runtime complexity should be less than O(n2).
# There is only one duplicate number in the array, but it could be repeated more than once.

def find_duplicate(nums)

  floor = 1
  ceiling = nums.length - 1
  pivot = (ceiling + floor) / 2
  until ceiling - floor < 2
    pivot = (ceiling + floor) / 2

    high_count = 0
    low_count = 0
    pivot_count = 0

    nums.each do |num|
      if num > pivot && num <= ceiling
        high_count += 1
      elsif num < pivot && num >= floor
        low_count += 1
      elsif num == pivot
        pivot_count += 1
      end
    end

    if pivot_count > high_count && pivot_count > low_count
      return pivot
    elsif high_count > low_count
      floor = pivot
    else
      ceiling = pivot
    end
  end

  if floor == pivot
    if nums.count(pivot) < nums.count(ceiling)
      return ceiling
    else
      return pivot
    end
  else
    if nums.count(pivot) < nums.count(floor)
      return floor
    else
      return pivot
    end
  end
ends

puts find_duplicate([1,2,3,4,5,5,6,7,8,9])
