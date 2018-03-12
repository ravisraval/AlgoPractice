# Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
#
# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
#
# You may assume that each input would have exactly one solution and you may not use the same element twice.
#
# Input: numbers={2, 7, 11, 15}, target=9
# Output: index1=1, index2=2


def two_sum(numbers, target)
  #ruby's bsearch is jank and doesn't check first value in array? so
  #artifically inserting another num in front, then ignoring it.
  numbers.unshift(0)
  numbers.each_with_index do |num1, idx1|
    next if idx1 == 0

    a = numbers.bsearch_index { |num2| num2 == target - num1 }
    next if a == 0
    return [idx1, a] if a
  end

end



numbers = [2,7,11,15]
target = 9
p two_sum(numbers, target)
