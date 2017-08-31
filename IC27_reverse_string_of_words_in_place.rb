# You're working on a secret team solving coded transmissions.
# Your team is scrambling to decipher a recent message, worried it's a plot to break into a major European National Cake Vault. The message has been mostly deciphered, but all the words are backwards! Your colleagues have handed off the last step to you.
#
# Write a function reverse_words() that takes a string message and reverses the order of the words in-place. ↴
#
# For example:
#
# # returns: 'if into the security recordings you go only pain will you find'
#
# When writing your function, assume the message contains only letters and spaces, and all words are separated by one space.


# def reverse_words(str)
#   word_array = str.split
#
#   i = 0
#   while i < word_array.length / 2
#     word_array[i], word_array[(i * -1) -1] = word_array[(i * -1) -1], word_array[i]
#
#     i += 1
#   end
#   word_array.join(" ")
# end

def reverse_string_in_place(str, start_idx, end_idx)
  until start_idx >= end_idx
    str[start_idx], str[end_idx] = str[end_idx], str[start_idx]

    start_idx += 1
    end_idx -= 1
  end
  str
end
# require 'byebug'
def reverse_words(str)
  str = reverse_string_in_place(str, 0, str.length - 1)

  current_start_idx = 0

  i = 0
  while i <= str.length
    # debugger
    if str[i] == ' ' || i == str.length
      str[current_start_idx...i] = reverse_string_in_place(str, current_start_idx, i - 1)[current_start_idx...i]

      current_start_idx = i + 1
    end

    i += 1
  end

  str
end

message = 'find you will pain only go you recordings security the into if'

p reverse_words(message)
