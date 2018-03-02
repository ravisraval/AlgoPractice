# Write a function to reverse a string in-place. ↴
def reverse_string_in_place(str)
  i = 0
  while i < str.length / 2
    str[i], str[(i * -1) - 1] = str[(i * -1) - 1], str[i]

    i += 1
  end
  str
end


p reverse_string_in_place("aleve")
p reverse_string_in_place("bag")
p reverse_string_in_place("banana")
