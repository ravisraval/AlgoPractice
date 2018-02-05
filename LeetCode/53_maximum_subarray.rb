def max_sub_array(nums)
  total_largest = current_largest = nums.first
      nums[1..-1].each do |num|
          if current_largest + num > num
              current_largest += num
          else
              current_largest = num
          end
          total_largest = [current_largest, total_largest].max
      end
      total_largest
end
