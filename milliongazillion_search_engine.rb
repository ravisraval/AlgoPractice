# I'm making a search engine called MillionGazillion™.
# I wrote a crawler that visits web pages, stores a few keywords in a database, and follows links to other web pages. I noticed that my crawler was wasting a lot of time visiting the same pages over and over, so I made a set, visited, where I'm storing URLs I've already visited. Now the crawler only visits a URL if it hasn't already been visited.
#
# Thing is, the crawler is running on my old desktop computer in my parents' basement (where I totally don't live anymore), and it keeps running out of memory because visited is getting so huge.
#
# How can I trim down the amount of space taken up by visited?


class Trie
  def initialize
    @root_node = {}
  end

  def check_present_and_add(word)

    current_node = @root_node
    is_new_word = false

    word.each_char do |char|
      if !current_node.has_key?(char) #if we haven't seen this before
        is_new_word = true #then we have a new word
        current_node[char] = {} #and this new node's val is a hash
      end
       #move into the thing we just made, or was already there
      current_node = current_node[char]
    end

    #after iterating through all chars, check if we already did this
    if !current_node.has_key?("End of word")
      is_new_word = true
      current_node["End of word"] = {}
    end

    return is_new_word
  end

end
