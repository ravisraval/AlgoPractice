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
