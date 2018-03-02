def find_non_duplicate_in_array(arr)

  unique_number = 0

  arr.each do |num|
    unique_number ^= num
  end

  unique_number
end

p find_non_duplicate_in_array([1,1,2,2,3,3,213,4,4,5,5])
