# There are two sorted arrays nums1 and nums2 of size m and n respectively.
#
# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
#
# Example 1:
# nums1 = [1, 3]
# nums2 = [2]
#
# The median is 2.0
# Example 2:
# nums1 = [1, 2]
# nums2 = [3, 4]
#
# The median is (2 + 3)/2 = 2.5

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)

  if nums1.empty? || nums2.empty?
    return halp(nums1, nums2)
  end

  while nums1.length + nums2.length > 5

    if nums1.length.even?
      pivot1 = nums1[(nums1.length / 2) - 1]
    else
      pivot1 = nums1[(nums1.length / 2)]
    end

    if nums2.length.even?
      pivot2 = nums2[(nums2.length / 2) - 1]
    else
      pivot2 = nums2[(nums2.length / 2)]
    end

    if pivot1 > pivot2
      nums1 = nums1[0..nums1.length / 2]

      if nums2.length.odd?
        nums2 = nums2[(nums2.length / 2) - 1.. -1]
      else
        nums2 = nums2[nums2.length / 2..- 1]
      end

    elsif pivot1 < pivot2

      nums2 = nums2[0..nums2.length / 2]

      if nums1.length.odd?
        nums1 = nums1[(nums1.length / 2) - 1.. -1]
      else
        nums1 = nums1[nums1.length / 2..- 1]
      end

    elsif pivot1 == pivot2

      unless nums1.length.even? && nums2.length.even?
        return nums1[nums1.length / 2]
      else
        #compare other side of median, take average of pivot1 and smaller other median
        if nums1[nums1.length / 2] > nums2[nums2.length / 2]
          return (pivot1 + nums2[nums2.length / 2]).fdiv(2)
        else
          return (pivot1 + nums1[nums1.length / 2]).fdiv(2)
        end

      end

    end
  end

  return halp(nums1, nums2)

end

def halp(nums1, nums2)

  combined = (nums1 + nums2).sort

  if combined.length.even?
    return (combined[(combined.length / 2) - 1] + combined[(combined.length / 2)]) .fdiv(2)
  else
    return combined[(combined.length / 2)]
  end
end
