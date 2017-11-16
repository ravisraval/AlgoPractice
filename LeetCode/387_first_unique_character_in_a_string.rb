# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
#
# Examples:
#
# s = "leetcode"
# return 0.
#
# s = "loveleetcode",
# return 2.
# Note: You may assume the string contain only lowercase letters.
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  letters = {}
  deleted = []
  s.split("").each_with_index do |ch, idx|
    next if deleted.include?(ch)
    if letters[ch]
      letters.delete(ch)
      deleted.push(ch)
    else
      letters[ch] = idx
    end
  end
  return -1 if letters.empty?
  letters.first.last

end

p first_uniq_char("ww")
