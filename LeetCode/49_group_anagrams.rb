# Given an array of strings, group anagrams together.
#
# For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Return:
#
# [
#   ["ate", "eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
# Note: All inputs will be in lower-case.


def letter_count(word)
  letter_hash = Hash.new(0)
  word.each_char do |ch|
    letter_hash[ch] += 1
  end
  letter_hash
end
