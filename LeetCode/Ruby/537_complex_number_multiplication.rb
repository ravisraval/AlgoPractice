#
# Given two strings representing two complex numbers.
#
# You need to return a string representing their multiplication. Note i2 = -1 according to the definition.
#
# Example 1:
# Input: "1+1i", "1+1i"
# Output: "0+2i"
# Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert it to the form of 0+2i.
# Example 2:
# Input: "1+-1i", "1+-1i"
# Output: "0+-2i"
# Explanation: (1 - i) * (1 - i) = 1 + i2 - 2 * i = -2i, and you need convert it to the form of 0+-2i.
# Note:
#
# The input strings will not have extra blank.
# The input strings will be given in the form of a+bi, where the integer a and b will both belong to the range of [-100, 100]. And the output should be also in this form.
# @param {String} a
# @param {String} b
# @return {String}
def complex_number_multiply(a, b)
    num1, spec1 = a.split("+")
    num2, spec2 = b.split("+")

    spec1_num = spec1[0..-2].to_i
    spec2_num = spec2[0..-2].to_i
    num1 = num1.to_i
    num2 = num2.to_i

    num_res = num1 * num2

    spec_end = num1 * spec2_num + num2 * spec1_num

    alt = spec1_num * spec2_num * -1

    num_res += alt

    "#{num_res}+#{spec_end}i"

end
