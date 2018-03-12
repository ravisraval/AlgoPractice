# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
#
# Note: You can only move either down or right at any point in time.
def min_path_sum(grid)

  return 0 if grid[0].empty?
  row = 0
  col = 0
  shortest = nil
  current_sum = 0
  num_stack = [[grid[row][col], current_sum, row, col]]

  until num_stack.empty?
    current_num, current_sum, row, col = num_stack.pop
    current_sum += current_num
    right = grid[row][col + 1]
    down = grid[row + 1]

    if right.nil? && down.nil?
      if shortest.nil? || current_sum < shortest
        shortest = current_sum
      end
    else
      if down
        num_stack.push([down[col], current_sum, row + 1, col])
      end
      if right
        num_stack.push([right, current_sum, row, col + 1])
      end
    end
  end
  shortest
end









end
