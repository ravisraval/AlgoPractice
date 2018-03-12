# Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
#
# Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)
#
# Example 1:
# [[0,0,1,0,0,0,0,1,0,0,0,0,0],
#  [0,0,0,0,0,0,0,1,1,1,0,0,0],
#  [0,1,1,0,1,0,0,0,0,0,0,0,0],
#  [0,1,0,0,1,1,0,0,1,0,1,0,0],
#  [0,1,0,0,1,1,0,0,1,1,1,0,0],
#  [0,0,0,0,0,0,0,0,0,0,1,0,0],
#  [0,0,0,0,0,0,0,1,1,1,0,0,0],
#  [0,0,0,0,0,0,0,1,1,0,0,0,0]]
# Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
# Example 2:
# [[0,0,0,0,0,0,0,0]]
# Given the above grid, return 0.
# Note: The length of each dimension in the given grid does not exceed 50.
# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  biggest_island_seen = 0
  visited = []
  grid.each_index do |rowidx|
    grid[rowidx].each_with_index do |cell, colidx|
      next if visited.include?([rowidx, colidx])

      if cell == 1
        visited, size = find_area(rowidx, colidx, 0)
        biggest_island_seen = [biggest_island_seen, size].max
      end

    end
  end
  biggest_island_seen
end


def find_area(rowidx, colidx, size)
  if grid[rowidx + 1] && grid[rowidx + 1][colidx] == 1
    visited, size = find_area(rowidx + 1, colidx, size + 1)
  end

  if grid[rowidx][colidx + 1] == 1
    visited, size = find_area(rowidx, colidx + 1, size)
  end

  size += 1
  visited.push([rowidx, colidx])

  [visited, size]
end
