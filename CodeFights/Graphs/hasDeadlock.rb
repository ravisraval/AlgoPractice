class Node
    attr_accessor :friends, :value
    def initialize(value)
        @friends = []
        @value = value
    end
end

def hasDeadlock(connections)
  nodes = {}
  connections.length.times do |n|
    nodes[n] = Node.new(n)
  end

    connections.each_with_index do |neighbors, idx|
      neighbors.each do |neighbor|
        nodes[idx].friends.push(nodes[neighbor])
      end
    end

    nodes.values.each do |node|
      next if traverse(node)
      return true
    end
    false
end

def traverse(node)
  visited = {}
  node_queue = [node]

  until node_queue.empty?
    curr_node = node_queue.shift

    return false if visited.has_key?(curr_node.value)
    visited[curr_node.value] = true

    curr_node.friends.each do |friend|
      node_queue.push(friend)
    end
  end
  true
end


p hasDeadlock([[1], [2], [3, 4], [4], [0]])
