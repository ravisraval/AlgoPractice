# Write a function for doing an in-place ↴ shuffle of an array.
# The shuffle must be "uniform," meaning each item in the original array must have the same probability of ending up in each spot in the final array.
#
# Assume that you have a function get_random(floor, ceiling) for getting a random integer that is >= floor and <= ceiling.


def in_place_array_shuffle(arr)

  arr.each_index do |idx|
    jdx = rand(0...arr.length)
    arr[jdx], arr[idx] = arr[idx], arr[jdx]
  end
  arr

end

p in_place_array_shuffle([1,2,3,4,5])
