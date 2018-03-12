# Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
#
# Note:
# The given integer is guaranteed to fit within the range of a 32-bit signed integer.
# You could assume no leading zero bit in the integer’s binary representation.
# Example 1:
# Input: 5
# Output: 2
# Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
# Example 2:
# Input: 1
# Output: 0
# Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
# @param {Integer} num
# @return {Integer}
def find_complement(num)
    num.to_s(2).split("").map do |ch|
        if ch == '1'
            '0'
        else
            '1'
        end
    end.join("").to_i(2)
end

#alt
def find_complement(num)
    ones = ('1' * num.to_s(2).length).to_i(2)
    ones ^ num
end
