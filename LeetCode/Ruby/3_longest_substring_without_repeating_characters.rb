# Given a string, find the length of the longest substring without repeating characters.
#
# Examples:
#
# Given "abcabcbb", the answer is "abc", which the length is 3.
#
# Given "bbbbb", the answer is "b", with the length of 1.
#
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


def length_of_longest_substring(s)
  longest = 0

  current_letters = []
  letter_pos_hash = {}
  start_idx = 0
  end_idx = 0
  i = 0
  while i < s.length
    ch = s[i]

    if s[start_idx...i].include?(ch)
      start_idx = letter_pos_hash[ch] + 1
      letter_pos_hash[ch] = i
    else
      current_letters.push(ch)
      letter_pos_hash[ch] = i
      longest = i - start_idx + 1 if (i - start_idx + 1) > longest
    end

    i += 1
  end

  longest
end
p length_of_longest_substring("dvdf")
