require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(size = 8)
    @store = Array.new(size, [])
    @count = 0
  end

  def insert(key)
    hashed = key.hash
    @store[hashed % @store.length].push(key)
    @count += 1
    resize! if count == @store.length
  end

  def include?(key)
    hashed = key.hash
    @store[hashed % @store.length].include?(key)
  end

  def remove(key)
    hashed = key.hash
    @store[hashed % @store.length].delete(key)
    @count -= 1
  end

  private

  def resize!
    new_store = Array.new(@store.length * 2, [])
    @store.each_with_index do |el, idx|
      new_store[idx].push(el)
    end
    @store = new_store
  end
end
