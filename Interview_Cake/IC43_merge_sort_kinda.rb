def merge_sorted_arrays(first_array, second_array)

  res = []

  until first_array.empty? || second_array.empty?
    if first_array[0] > second_array[0]
      res.push(second_array.shift)
    else
      res.push(first_array.shift)
    end
  end
  res.concat(first_array + second_array)

  res
end


my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]
puts merge_sorted_arrays(my_array, alices_array)
