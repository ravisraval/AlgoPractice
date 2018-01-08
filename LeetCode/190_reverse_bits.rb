# Reverse bits of a given 32 bits unsigned integer.
#
# For example, given input 43261596 (represented in binary as 00000010100101000001111010011100), return 964176192 (represented in binary as 00111001011110000010100101000000).

# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
    n = n.to_s(2)
    n.prepend('0') until n.length == 32
    n.reverse.to_i(2)
end
