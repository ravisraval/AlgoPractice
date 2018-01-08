# Given a string, print the longest repeating subseequence such that the two subsequence don’t have same string character at same position, i.e., any i’th character in the two subsequences shouldn’t have the same index in the original string.
#
#
# More Examples:
#
# Input: str = "aabb"
# Output: "ab"
#
# Input: str = "aab"
# Output: "a"
# The two subssequence are 'a'(first) and 'a'
# (second). Note that 'b' cannot be considered
# as part of subsequence as it would be at same
# index in both.

# def longest_repeat(str)
#
# end
#
# longest_repeat('aabebcdd')

def overlap?(start1, end1, start2, end2)
  if (start1 < start2 && start2 < end2 &&
      end1 < start2 && end1 < end2) ||
     (start1 > start2 && start1 > end2 &&
      end1 > start1 && end1 > start2)
    return false
  end
  true
end

start1 = 1
end1 = 3
start2 = 0
end2 = 0
p overlap?(start1, end1, start2, end2)
