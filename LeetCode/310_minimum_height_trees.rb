# For a undirected graph with tree characteristics, we can choose any node as the root. The result graph is then a rooted tree. Among all possible rooted trees, those with minimum height are called minimum height trees (MHTs). Given such a graph, write a function to find all the MHTs and return a list of their root labels.
#
# Format
# The graph contains n nodes which are labeled from 0 to n - 1. You will be given the number n and a list of undirected edges (each edge is a pair of labels).
#
# You can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
#
# Example 1:
#
# Given n = 4, edges = [[1, 0], [1, 2], [1, 3]]
#
#         0
#         |
#         1
#        / \
#       2   3
# return [1]
#
# Example 2:
#
# Given n = 6, edges = [[0, 3], [1, 3], [2, 3], [4, 3], [5, 4]]
#
#      0  1  2
#       \ | /
#         3
#         |
#         4
#         |
#         5
# return [3, 4]
#
# Note:
#
# (1) According to the definition of tree on Wikipedia: “a tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.”
#
# (2) The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.
# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
class Node
    attr_accessor :friends, :max_depth, :value
    def initialize(value)
        @value = value
        @friends = []
        @max_depth = 1
    end
end

def find_min_height_trees(n, edges)
    node_hash = {}
    n.times do |time|
        node_hash[time] = Node.new(time)
    end
    edges.each do |pair|
        val1, val2 = pair
        #make nodes if not there already
        if !node_hash.has_key? val1
            node_hash[val1] = Node.new(val1)
        end
        if !node_hash.has_key? val2
            node_hash[val2] = Node.new(val2)
        end

        node_hash[val1].friends.push(val2)
        node_hash[val2].friends.push(val1)
    end

    node_hash.values.each do |node|

        #dfs, find max height
        visited = []
        node_stack = [[node, 0]]
        max_depth_seen = 1

        until node_stack.empty?
            curr_node, depth = node_stack.pop
            visited.push(curr_node.value)

            # if curr_node.max_depth
                # curr_depth = curr_node.max_depth + depth
                # max_depth_seen = curr_depth if curr_depth > max_depth_seen
            if (curr_node.friends - visited).empty? #if we're at a leaf
                max_depth_seen = depth if depth > max_depth_seen
            else
                curr_node.friends.each do |friend|
                    node_stack.push([node_hash[friend], depth + 1]) unless visited.include?(friend)
                end
            end
        end
        node.max_depth = max_depth_seen
    end

    lowest_height_node_value = nil
    winning_nodes = []
    p node_hash
    node_hash.values.each do |node|
        if lowest_height_node_value.nil? || node.max_depth < lowest_height_node_value
            lowest_height_node_value = node.max_depth
            winning_nodes = [node.value]
        elsif lowest_height_node_value == node.max_depth
            winning_nodes.push(node.value)
        end
    end
    winning_nodes
end
