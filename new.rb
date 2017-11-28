def ascii_deletion_distance(str1, str2)
  str1 = str1.split("")
  str2 = str2.split("")

  idx = 0
  while idx < str1.length
    ch = str1[idx]
    place = str2.index(ch)
    if place
      str2.delete_at(place)
      str1.delete_at(idx)
    else
      idx += 1
    end
  end

  idx = 0
  while idx < str2.length
    ch = str2[idx]
    place = str1.index(ch)
    if place
      str1.delete_at(place)
      str2.delete_at(idx)
    else
      idx += 1
    end
  end
  ch1 = str1.map { |ch| ch.ord }
  ch2 = str2.map { |ch| ch.ord }
  if ch1.empty? && ch2.empty?
    0
  elsif ch1.empty?
    ch2.reduce(:+)
  elsif ch2.empty?
    ch1.reduce(:+)
  else
    ch1.reduce(:+) + ch2.reduce(:+)
  end
end


# p ascii_deletion_distance('boat', 'got')


# You're running a pool of servers where the servers are numbered sequentially
# starting from 1.
#
# Over time, any given server might explode, in which case its
# server number is made available for reuse.
#
# When a new server is launched, it should be given the lowest available number.
#
# Write a function which, given the list of currently allocated server numbers,
# returns the number of the next server to allocate.
#
# In addition, you should demonstrate your approach to testing that your
# function is correct.
#
# You may choose to use an existing testing library for your language if you choose, or you may write your own process if you prefer.
#
# For example, your function should behave something like the following:
#
#   >> next_server_number([5, 3, 1])
#   2
#   >> next_server_number([5, 4, 1, 2])
#   3
#   >> next_server_number([3, 2, 1])
#   4
#   >> next_server_number([2, 3])
#   1
#   >> next_server_number([])
#   1
# 5, 3, 1
