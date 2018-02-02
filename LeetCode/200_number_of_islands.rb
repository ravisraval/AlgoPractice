# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
#
# Example 1:
#
# 11110
# 11010
# 11000
# 00000
# Answer: 1
#
# Example 2:
#
# 11000
# 11000
# 00100
# 00011
# Answer: 3
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    islands = 0

    for i in (0...grid.length) do
        for j in (0...grid[i].length) do
            islands += sink(grid, i, j)
        end
    end

    islands
end

def sink(grid, i, j)
    return 0 if i < 0 || i == grid.length || j < 0 || j == grid[i].length || grid[i][j] == '0'

    grid[i][j] = '0'

    sink(grid, i + 1, j)
    sink(grid, i - 1, j)
    sink(grid, i, j + 1)
    sink(grid, i, j - 1)

    1
end

if new_row >= 1 && grid[new_row - 1][new_col] == 'Y'
      y_stack.push([new_row - 1, new_col])
    end
    if new_row < grid.length - 1 && grid[new_row + 1][new_col] == 'Y'
      y_stack.push([new_row + 1,new_col])
    end
    if new_col >= 1 && grid[new_row][new_col - 1] == 'Y'
      y_stack.push([new_row, new_col - 1])
    end
    if new_col < grid[0].length - 1 && grid[new_row][new_col + 1] == 'Y'
      y_stack.push([new_row, new_col+1])
    end
