# Given a m x n matrix, if an element is 0, set its entire row and column to 0.
# Do it in place.

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  rows = Array.new(matrix.length, 1)
  cols = Array.new(matrix[0].length, 1)

  matrix.each_with_index do |row, rowidx|
    row.each_with_index do |cell, colidx|
      if cell == 0
        rows[rowidx] = 0
        cols[colidx] = 0
      end
    end
  end

  rows.each_with_index do |row, rowidx|
    next if row == 1
    matrix[rowidx] = Array.new(matrix[0].length, 0)
  end

  cols.each_with_index do |col, colidx|
    next if col == 1
    matrix.each do |row|
      row[colidx] = 0
    end
  end
end
