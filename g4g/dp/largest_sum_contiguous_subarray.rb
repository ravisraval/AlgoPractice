# find the sum of contiguous subarray within a one-dimensional array of numbers which has the largest sum.
#
# kadane-algorithm

def largest_sum(arr)
  largest_sum = largest_current_sum = arr[0]
  idx = 0
  while idx < arr.length
    largest_sum = [arr[idx], (largest_sum + arr[idx])].max
    largest_current_sum = [largest_current_sum, largest_sum].max
    idx += 1
  end

  largest_sum
end

p largest_sum([-2, -3, 4, -1, -2, 1, 5, -3])
