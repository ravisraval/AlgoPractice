#
# A message containing letters from A-Z is being encoded to numbers using the following mapping:
#
# 'A' -> 1
# 'B' -> 2
# ...
# 'Z' -> 26
# Given an encoded message containing digits, determine the total number of ways to decode it.
#
# For example,
# Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).
#
# The number of ways decoding "12" is 2.
#

def num_decodings(s)

   decode = ('A'..'Z').to_a
   number_of_prev_ended_singly = 1

   ways_count = 1
   number_of_prev_ended_singly = 1

   s.chars[1..-1].each_with_index do |ch, idx|
     if s[idx - 1].to_i == 1 ||
       s[idx - 1] == 2.to_i && ch.to_i.between?(1,6)

       numbers_added_this_time = ways_count - number_of_prev_ended_singly
       ways_count += numbers_added_this_time
       number_of_prev_ended_singly = numbers_added_this_time
     else
       number_of_prev_ended_singly = 0
     end
   end

   ways_count

end

p num_decodings
