# I want to learn some big words so people think I'm smart.
# I opened up a dictionary to a page in the middle and started flipping through, looking for words I didn't know. I put each word I didn't know at increasing indices in a huge array I created in memory. When I reached the end of the dictionary, I started from the beginning and did the same thing until I reached the page I started at.
#
# Now I have an array of words that are mostly alphabetical, except they start somewhere in the middle of the alphabet, reach the end, and then start from the beginning of the alphabet. In other words, this is an alphabetically ordered array that has been "rotated." For example:
#
  word_arr = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'xylophone',
    'asymptote', # <-- rotates here!
    'attractive',
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'orange',
    'othellolagkage',
]
#
# Write a function for finding the index of the "rotation point," which is where I started working from the beginning of the dictionary. This array is huge (there are lots of words I don't know) so we want to be efficient here.


def find_rotation_point(words, begin_idx = 0, end_idx = words.length - 1, i = 0)
  if words[begin_idx..end_idx].length == 2
    puts "I found a winner"
    puts "#{words[begin_idx]} is the pivoting word"
    return "which occurs at index #{begin_idx}"
  end

  pivot = (end_idx - begin_idx) / 2
  pivot += 1 if begin_idx == 0 && end_idx == words.length - 1

  if words[pivot][i].ord < words[end_idx][i].ord #switch is before
    return find_rotation_point(words, begin_idx, pivot, i)
  elsif words[pivot][i].ord > words[end_idx][i].ord
    return find_rotation_point(words, pivot + begin_idx, end_idx, i)
  elsif i == words[pivot].length
    return pivot
  else
    return find_rotation_point(words, begin_idx, end_idx, i + 1)
  end
end

p find_rotation_point(word_arr)
