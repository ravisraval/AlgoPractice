``
7:49 (+9 jank no whiteboard)

Tree with n nodes
1-n

01001


4
32
1
5

331

  2
15
  46
  3

5544

List, grid (empty)


n == grid.length - 1
Leaves = [1..n] - list, and sort
Find last_idx of each item in List


Iterate through Leaves w/idx
Set matrix[leaf][list[idx]] = true && matrix[last[idx]][leaf]
Check if we need to add on list_item if curr_idx == last_idx + 1

Connect last two unique elements in list (tree)

def tree_from_list(list, grid)
	N == grid.length
	Curr_leaves = (1..n).to_a
	List.uniq.each { |list_item| curr_leaves.delete(list_item) } # n^2
	curr_leaves.sort!
	# Curr_leaves = [1,2,3,6]

List.each_with_index do |list_item, idx| # 5,5,4,4
	Curr_leaf = curr_leaves.shift
	grid[curr_leaf][list_item] = true
	Grid[list_item][curr_leaf] = true

	If last_idx(list, idx)
		curr_leaves.push(list[idx]).sort!
End
End

Curr_leaves = [4,6]

Grid[curr_leaves[0]][curr_leaves[1]] = true
Grid[curr_leaves[1]][curr_leaves[0]] = true

Grid
End

Def last_idx(list, idx)
	List_item = list[idx]
	While idx < list.length
		Return false if list[idx] == list_item
		idx += 1
End
true
end
