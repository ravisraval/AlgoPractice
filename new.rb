# def ascii_deletion_distance(str1, str2)
#   str1 = str1.split("")
#   str2 = str2.split("")
#
#   idx = 0
#   while idx < str1.length
#     ch = str1[idx]
#     place = str2.index(ch)
#     if place
#       str2.delete_at(place)
#       str1.delete_at(idx)
#     else
#       idx += 1
#     end
#   end
#
#   idx = 0
#   while idx < str2.length
#     ch = str2[idx]
#     place = str1.index(ch)
#     if place
#       str1.delete_at(place)
#       str2.delete_at(idx)
#     else
#       idx += 1
#     end
#   end
#   ch1 = str1.map { |ch| ch.ord }
#   ch2 = str2.map { |ch| ch.ord }
#   if ch1.empty? && ch2.empty?
#     0
#   elsif ch1.empty?
#     ch2.reduce(:+)
#   elsif ch2.empty?
#     ch1.reduce(:+)
#   else
#     ch1.reduce(:+) + ch2.reduce(:+)
#   end
# end
#
# # p ascii_deletion_distance('boat', 'got')
#
# # [5, 4, 2, 3]
# #
# # 5(4) + 5(2) + 5(3) + 4(2) + 4(3) + 2(3)
# # 5(4 + 2 + 3) + 4(2 + 3) + 2(3)
#
# def mult_arr(arr)
#   total = 0
#   remaining_sum = arr.reduce(:+)
#
#   arr[0..-1].each do |num|
#     remaining_sum -= num
#     total += num * remaining_sum
#   end
#
#   total
#
# end
# require 'set'
# def count(s)
#   res = Set.new
#     s.chars.each_with_index do |ch, idx|
#
#       left_idx = idx
#       right_idx = idx
#
#       until left_idx == 0 && right_idx == s.length - 1
#         substring = s[left_idx..right_idx]
#
#         if substring == substring.reverse
#           res << substring
#
#           # check left
#           unless left_idx == 0
#             substring = s[left_idx - 1..right_idx]
#             if substring == substring.reverse
#               res << substring
#             end
#           end
#
#           # check right
#           unless right_idx == s.length - 1
#             substring = s[left_idx..right_idx + 1]
#             if substring == substring.reverse
#               res << substring
#             end
#           end
#
#           left_idx -= 1 unless left_idx == 0
#           right_idx += 1 unless right_idx == s.length - 1
#
#         else # wasn't a palindrome, so no need to keep checking
#           left_idx -= 1 unless left_idx == 0
#           right_idx += 1 unless right_idx == s.length - 1
#           next
#         end
#       end
#     end
#
#     res << s if s == s.reverse
#     res.length
# end
#
# p count('cacac')
#
# def other_count(s)
#   res = Set.new
#   s.chars.each_index do |idx|
#     s[idx..-1].chars.each_index do |jdx|
#       substr = s[idx..jdx]
#       next if substr.empty?
#       res << substr if substr == substr.reverse
#     end
#   end
#   p res
#   res.length
# end
# p other_count('cacac')

def thing(input)
  sub_inputs = [input[0]]
  input[1..-1].each_char do |ch|
    new_sub_input = []
    sub_inputs.each do |old_str|
      new_sub_input.push(old_str + ch, old_str + ' ' + ch)
    end

    sub_inputs = new_sub_input
  end
  sub_inputs
end

p thing('abcd')
