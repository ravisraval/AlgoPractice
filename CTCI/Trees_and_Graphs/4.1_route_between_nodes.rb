# to find out whether there is a router btwn two nodes
require_relative 'poly_tree_node'
#given a directed graph, design an algorithm
# require 'byebug'
def route_between_nodes?(source_node, destination_node)
  return true if source_node == destination_node

  node_queue = [source_node]

  until node_queue.empty?
    # debugger
    current_node = node_queue.shift

    current_node.visited = true

    current_node.children.each do |child|
      next if child.visited
      return true if child == destination_node
      node_queue.push(child)
    end

  end

  false
end

def testf

  a = Node.new(1)
  b = Node.new(1)
  c = Node.new(1)
  d = Node.new(1)
  e = Node.new(1)
  f = Node.new(1)
  g = Node.new(1)

  a.children.push(b, c)
  b.children.push(d, e)
  c.children.push(g)
  g.children.push(a)
  p route_between_nodes?(a, f)

  a.visited = false
  b.visited = false
  c.visited = false
  d.visited = false
  e.visited = false
  f.visited = false
  g.visited = false

  a.children = []
  b.children = []
  c.children = []
  d.children = []
  e.children = []
  f.children = []
  g.children = []

  a.children.push(b, c)
  b.children.push(d, e)
  c.children.push(g)
  g.children.push(a)

  p route_between_nodes?(a, g)
end

testf
