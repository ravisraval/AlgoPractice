# I have an array of n + 1n+1 numbers. Every number in the range 1..n1..n appears once except for one number that appears twice.
# Write a function for finding the number that appears twice.


def find_duplicate(arr)
  n = (arr.length - 1)
  proper_sum = (n ** 2 + n).fdiv(2)
  answer = arr.reduce(:+) - proper_sum
  return 'no duplicates' if answer == 0
  answer
end


p find_duplicate([1,2,3,4,5,6,6,7,8,9])
