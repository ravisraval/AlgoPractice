#given a directed graph, design an algorithm
# to find out whether there is a router btwn two nodes
require_relative 'poly_tree_node'

def route_between_nodes?(source_node, destination_node)
  return true if source_node == destination_node


  node_queue = [source_node]

  until node_queue.empty?

    current_node = node_queue.shift

    next if current_node.visited
    current_node.visited = true

    current_node.children.each do |child|
      next if child.visited
      return true if child == destination_node
      node_queue.push(child)
    end

  end

  false
end


a = Node.new(1)
b = Node.new(2)
c = Node.new(3)
d = Node.new(4)
e = Node.new(5)
f = Node.new(6)
g = Node.new(7)


a.children.push(b, c)
b.children.push(d, e, f)
c.children.push(g)
g.children.push(a)

p route_between_nodes?(a, g)
