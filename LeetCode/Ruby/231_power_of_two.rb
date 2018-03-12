# Given an integer, write a function to determine if it is a power of two.

# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    return false if n <= 0
    n.to_s(2).count('1') == 1
end
