# Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
#
#
# American keyboard
#
#
# Example 1:
# Input: ["Hello", "Alaska", "Dad", "Peace"]
# Output: ["Alaska", "Dad"]
# Note:
# You may use one character in the keyboard more than once.
# You may assume the input string will only contain letters of alphabet.
# @param {String[]} words
# @return {String[]}
def find_words(words)
    top_row = %w(q w e r t y u i o p)
    mid_row = %w(a s d f g h j k l)
    bottom_row = %w(z x c v b n m)
    words.select do |word|
        word.downcase.split("").all? { |ch| top_row.include?(ch)} ||
            word.downcase.split("").all? { |ch| mid_row.include?(ch)} ||
            word.downcase.split("").all? { |ch| bottom_row.include?(ch)}
    end
end
