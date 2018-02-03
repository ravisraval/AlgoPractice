# find the sum of contiguous subarray within a one-dimensional array of numbers which has the largest sum.
#

def largest_sum(arr)
  largest_sum = largest_current_sum = arr[0]

  arr[1..-1].each do |el|
    largest_current_sum = [el, largest_current_sum + el].max
    largest_sum = [largest_sum, largest_current_sum].max
  end
  largest_sum
end

p largest_sum([-2, -3, 4, -1, -2, 1, 5, -3])

def largest_sum_with_indices(arr)
  largest_sum = largest_current_sum = arr[0]
  largest_start = largest_ending = curr_start = curr_ending = 0

  idx = 1
  while idx < arr.length
    el = arr[idx]

    if largest_current_sum + el > el
      largest_current_sum += el
      curr_ending += 1
    else
      largest_current_sum = el
      curr_start = idx
      curr_ending = idx
    end

    if largest_current_sum > largest_sum
      largest_sum = largest_current_sum
      largest_start = curr_start
      largest_ending = curr_ending
    end

    idx += 1
  end

  puts "#{largest_sum} from #{largest_start} to #{largest_ending}"
end

largest_sum_with_indices([-2, -3, 4, -1, -2, 1, 5, -3])
