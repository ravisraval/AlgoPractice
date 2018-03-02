# You want to build a word cloud, an infographic where the size of a word corresponds to how often it appears in the body of text.
# To do this, you'll need data. Write code that takes a long string and builds its word cloud data in a hash ↴ , where the keys are words and the values are the number of times the words occurred.
#
# Think about capitalized words. For example, look at these sentences:
#
#   "After beating the eggs, Dana read the next step:"
# "Add milk and eggs, then add flour and sugar."
# What do we want to do with "After", "Dana", and "add"? In this example, your final hash should include one "Add" or "add" with a value of 22. Make reasonable (not necessarily perfect) decisions about cases like "After" and "Dana".
#
# Assume the input will only contain words and standard punctuation.
#
# You could make a reasonable argument to use regex in your solution. We won't, mainly because performance is difficult to measure and can get pretty bad.

def word_cloud(str)
  letters = ('A'..'z').to_a
  letters.push('-')
  
  word_cloud = Hash.new(0)

  start_idx = nil
  previous_idx_was_letter = false
  str.chars.each_with_index do |ch, idx|

    if letters.include?(ch)

      if !start_idx #set start of word if we aren't in a word already
        # p 'here'
        start_idx = idx
      elsif idx == str.length - 1
        word_cloud[str[start_idx..idx].downcase] += 1
      else #otherwise continue
        next
      end

    else #if space or punc

      if start_idx
        word_cloud[str[start_idx...idx].downcase] += 1
        start_idx = nil
      else
        next
      end
    end

  end

  word_cloud


end

 p word_cloud("I love bananas and all and stuff, but mostly bananas.")
