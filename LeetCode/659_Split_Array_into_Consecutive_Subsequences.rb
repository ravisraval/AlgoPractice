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
  # sub_hash = Hash.new([])
  sub_hash = {0 => []}

  sub_hash[0].push(given_array.first)

  #make hash values ascending arrays
  given_array[1..-1].each do |num|
    need_new_sub = true

    sub_hash.keys.each do |key|
      if num == sub_hash[key].last + 1
        sub_hash[key].push(num)
        need_new_sub = false
        break
      end
    end

    if need_new_sub
      subs_made += 1
      sub_hash[subs_made] = []
      sub_hash[subs_made].push(num)
    end

  end

  p sub_hash

  return false if sub_hash.any? { |k, v| v.length < 3 }
  return false if sub_hash.keys.length < 2

  true
end

#thoughts
#make one array as long as possibru
#see if what is left over is consecutive, or needs part of array 1

p can_split?([1,2,3,3,4,5])
p can_split?([1,2,3,4,5,6])
# p can_split?([1,2,3,3,4,5])
# p can_split?([1,2,3,3,4,5])
