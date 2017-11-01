# Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
#
# Integers in each row are sorted in ascending from left to right.
# Integers in each column are sorted in ascending from top to bottom.
# For example,
#
# Consider the following matrix:
#
# [
#   [1,   4,  7, 11, 15],
#   [2,   5,  8, 12, 19],
#   [3,   6,  9, 16, 22],
#   [10, 13, 14, 17, 24],
#   [18, 21, 23, 26, 30]
# ]
# Given target = 5, return true.
#
# Given target = 20, return false.



# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  high_col = high_col_search(matrix, target)
  return true if high_col == true
  smaller_matrix = matrix[0..high_col]

  high_row = high_row_search(smaller_matrix, target)
  return true if high_row == true

  smaller_matrix = smaller_matrix.map { |row| row[0..high_row] }

  # inc

end

def high_col_search(matrix, target)
  colidx = matrix.length / 2

  if matrix[colidx][0] == target
    return true
  elsif matrix[colidx][0] > target
    return high_col_search(matrix[0...colidx], target)
  elsif matrix[colidx][0] < target
    return matrix.length
  end

end

def high_row_search(matrix, target)
  rowidx = matrix[0].length / 2

  if matrix[0][rowidx] == target
    return true
  elsif matrix[0][rowidx] > target
    return high_row_search(matrix[0][0...rowidx], target)
  else
    return matrix[0].length
  end
end

search_matrix([
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
], 5)
