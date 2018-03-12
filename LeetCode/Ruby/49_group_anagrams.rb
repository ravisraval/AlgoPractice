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
  word.chars.each do |ch|
    letter_hash[ch] += 1
  end
  letter_hash
end

def group_anagrams(strs)
  word_res = Hash.new { |h, k| h[k] = [] }

  strs.each do |word|
    word_res[letter_count(word).hash].push(word)
  end

  word_res.values
end

a = ["eat","tea","tan","ate","nat","bat"]

p group_anagrams(a)
