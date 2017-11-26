# Write a function that takes a string as input and reverse only the vowels of a string.
#
# Example 1:
# Given s = "hello", return "holle".
#
# Example 2:
# Given s = "leetcode", return "leotcede".
#
# Note:
# The vowels does not include the letter "y".

# @param {String} s
# @return {String}
def reverse_vowels(s)
    vowels = %w(a e i o u)
    hsh = {}
    s.chars.each_with_index do |ch, idx|
        if vowels.include?(ch.downcase)
            hsh[idx] = ch
        end
    end
    indices = hsh.keys.reverse
    idx = 0
    while idx < indices.length
        s[indices[idx]] = hsh[hsh.keys[idx]]
        idx += 1
    end
    s
end
