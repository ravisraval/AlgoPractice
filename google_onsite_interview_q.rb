# 7:49 (+9 jank no whiteboard)
#
# Tree with n nodes
# 1-n
#
# 01001
#
#
# 4
# 32
# 1
# 5
#
# 331
#
#   2
# 15
#   46
#   3
#
# 5544
#
# Question: Given a tree, the smallest leaf is continually popped.
# A list is made of the node to which the popped leaf was connected.
# Given this list, remake the tree.

# List, grid (empty)
#
#
# n == grid.length - 1
# Leaves = [1..n] - list, and sort
# Find last_idx of each item in List
#
#
# Iterate through Leaves w/idx
# Set matrix[leaf][list[idx]] = true && matrix[last[idx]][leaf]
# Check if we need to add on list_item if curr_idx == last_idx + 1
#
# Connect last two unique elements in list (tree)
#
def tree_from_list(list, grid)
	n == grid.length
	curr_leaves = (1..n).to_a
	list.uniq.each { |list_item| curr_leaves.delete(list_item) } # n^2
	curr_leaves.sort!
	# Curr_leaves = [1,2,3,6]

  list.each_with_index do |list_item, idx| # 5,5,4,4
  	curr_leaf = curr_leaves.shift
  	grid[curr_leaf][list_item] = true
  	grid[list_item][curr_leaf] = true

  	if last_idx(list, idx)
  		curr_leaves.push(list[idx]).sort!
    end
  end

  grid[curr_leaves[0]][curr_leaves[1]] = true
  grid[curr_leaves[1]][curr_leaves[0]] = true

  grid
end

def last_idx(list, idx)
	list_item = list[idx]
	while idx < list.length
		return false if list[idx] == list_item
		idx += 1
  end

  true
end
