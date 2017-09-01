def merge_ranges(arr)
  arr.sort_by! {|sub_arr| sub_arr[0]}

  ranges = []
  arr.each_with_index do |sub_arr, idx|

    first = sub_arr

    if idx == arr.length - 1
      ranges << first
      break
    end

    second = arr[idx + 1]

    if first[1] >= second[0] #if overlap
      if first[1] > second[1] #determine which meeting ends later
        arr[idx + 1] = first
      else
        arr[idx + 1] = [first[0], second[1]]
      end
    else
      ranges << first
    end

  end
  ranges
end



p merge_ranges([[1, 10], [2, 6], [3, 5], [7, 9]])
