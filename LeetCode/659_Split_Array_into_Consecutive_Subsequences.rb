#
# You are given an integer array sorted in ascending order (may contain duplicates), you need to split them into several subsequences, where each subsequences consist of at least 3 consecutive integers. Return whether you can make such a split.
#
# Example 1:
# Input: [1,2,3,3,4,5]
# Output: True
# Explanation:
# You can split them into two consecutive subsequences :
# 1, 2, 3
# 3, 4, 5
# Example 2:
# Input: [1,2,3,3,4,4,5,5]
# Output: True
# Explanation:
# You can split them into two consecutive subsequences :
# 1, 2, 3, 4, 5
# 3, 4, 5
# Example 3:
# Input: [1,2,3,4,4,5]
# Output: False
# Note:
# The length of the input is in range of [1, 10000]

def can_split?(given_array)
  #this doesn't work as is..have to look into duplicates
  subs_made = 0
  second_sub_array = []

  idx = 0
  while idx < given_array.length
    current = given_array[idx]
    plus_one = given_array[idx + 1]
    plus_two = given_array[idx + 2]

    if current + 1 == plus_one && plus_one + 1 == plus_two
      subs_made += 1
      idx += 3
    else
      idx += 1
    end

    return true if subs_made == 2
  end

  false
end
p can_split?([1,2,3,3,4,5])
p can_split?([1,2,3,3,4,5])
p can_split?([1,2,3,3,4,5])
p can_split?([1,2,3,3,4,5])
