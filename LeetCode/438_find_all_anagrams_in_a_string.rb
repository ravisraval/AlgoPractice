# Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
#
# Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
#
# The order of output does not matter.
#
# Example 1:
#
# Input:
# s: "cbaebabacd" p: "abc"
#
# Output:
# [0, 6]
#
# Explanation:
# The substring with start index = 0 is "cba", which is an anagram of "abc".
# The substring with start index = 6 is "bac", which is an anagram of "abc".
# Example 2:
#
# Input:
# s: "abab" p: "ab"
#
# Output:
# [0, 1, 2]
#
# Explanation:
# The substring with start index = 0 is "ab", which is an anagram of "ab".
# The substring with start index = 1 is "ba", which is an anagram of "ab".
# The substring with start index = 2 is "ab", which is an anagram of "ab".

# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  orig = letters(p)
  res = []

  idx = 0

  hsh = letters(s[0...p.length])
  if orig == hsh
    res.push(0)
  end
  hsh[s[0]] -= 1
  idx += 1
  while idx < s.length - p.length + 1
    hsh[s[idx + p.length - 1]] += 1
    if orig == hsh.select { |k,v| v > 0 }
      res.push(idx)
    end
    # take off last, add one more
    hsh[s[idx]] -= 1
    idx += 1
  end
  res
end

def letters(str)
  hsh = Hash.new(0)
  str.each_char do |ch|
    hsh[ch] += 1
  end
  hsh
end
