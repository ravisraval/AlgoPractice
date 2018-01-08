# Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.
#
# Example 1:
# Input: 5
# Output: True
# Explanation:
# The binary representation of 5 is: 101
# Example 2:
# Input: 7
# Output: False
# Explanation:
# The binary representation of 7 is: 111.
# Example 3:
# Input: 11
# Output: False
# Explanation:
# The binary representation of 11 is: 1011.
# Example 4:
# Input: 10
# Output: True
# Explanation:
# The binary representation of 10 is: 1010.

# @param {Integer} n
# @return {Boolean}
def has_alternating_bits(n)
    bin = n.to_s(2)
    idx = 0
    while idx < bin.length - 1
        return false if bin[idx] == bin[idx + 1]
        idx += 1
    end
    true
end
