# Implement a trie with insert, search, and startsWith methods.
# Note:
# You may assume that all inputs are consist of lowercase letters a-z.

class TrieNode
  attr_accessor :children
  def initialize
    @children = {}
  end
end

class Trie

    def initialize()
      @root = TrieNode.new
    end

=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
      current_node = @root

      word.chars.each do |ch|
        if !current_node.children.has_key?(ch)
          current_node.children[ch] = TrieNode.new
        end

        current_node = current_node.children[ch]
      end

      current_node.children['$'] = true
    end

=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
      current_node = @root
      word.chars.each do |ch|
        if current_node.children.has_key?(ch)
          current_node = current_node.children[ch]
        else
          return false
        end
      end

      if current_node.children.has_key?('$')
        true
      else
        false
      end
    end

=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
      current_node = @root
      prefix.chars.each do |ch|
        if current_node.children.has_key?(ch)
          current_node = current_node.children[ch]
        else
          return false
        end
      end
      true
    end

end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
