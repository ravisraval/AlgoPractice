# Complete the function below.
def num_fields(grid)
  fields = 0

  grid.length.times do |rowidx|
    grid[rowidx].length.times do |colidx|
      if grid[rowidx][colidx] == 'Y'
        fields += get_bounds(rowidx, colidx, grid)
      end
    end
  end

  fields
end

def get_bounds(rowidx, colidx, grid)
  if rowidx < 0 || rowidx == grid.length || colidx < 0 ||
     colidx == grid[rowidx].length || grid[rowidx][colidx] == 'N'
    return 0
  end

  # delete surrounding fields recursively
  # get_bounds(rowidx + 1, colidx, grid)
  # get_bounds(rowidx - 1, colidx, grid)
  # get_bounds(rowidx, colidx + 1, grid)
  # get_bounds(rowidx, colidx - 1, grid)
  # i think we're getting a stack overflow cuz of recursion.. let's try iterating
  # guess not! womp

  y_stack = [[rowidx, colidx]]
  until y_stack.empty?
    new_row, new_col = y_stack.pop

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

    grid[new_row][new_col] = 'N'
  end

  1
end

def Group(grid)
  gridified = grid.map { |str| str.split("") }
  total_fields = num_fields(gridified)
  return 1 if total_fields == 0
  2 ** (total_fields - 1) % 1_000_000_007
end
