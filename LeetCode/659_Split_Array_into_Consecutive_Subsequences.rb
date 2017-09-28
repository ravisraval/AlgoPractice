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
  sub_hash = Hash.new([])
  sub_hash[0].push(given_array.first)

  given_array[1..-1].each do |num|
    if num == sub_hash[subs_made].last + 1
      sub_one.push(num)
    else
      sub_two.push(num)
    end
  end

  return false if sub_one.length < 3



  # false
end

#thoughts
#make one array as long as possibru
#see if what is left over is consecutive, or needs part of array 1
def split_brute?(given_array)

  sub_1 = []
  sub_2 = []





end

p can_split?([1,2,3,3,4,5])
p can_split?([1,2,3,3,4,5])
p can_split?([1,2,3,3,4,5])
p can_split?([1,2,3,3,4,5])
