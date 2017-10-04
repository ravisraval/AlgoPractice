# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
#
# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
#
# How many possible unique paths are there?
#
#
# Above is a 3 x 7 grid. How many possible unique paths are there?
#
# Note: m and n will be at most 100.

#thoughts
  # make a graph of these guys  (would that take a lot?)
  # count how many paths there are to bottom
  # reminiscent of knight problem in A/A?



  #think about simplest version


  def unique_paths(m, n)
    matrix = Array.new(m) { Array.new(n, 1) }

    matrix[1..-1].each_with_index do |row, row_idx|
      row[1..-1].each_with_index do |cell, col_idx|
        matrix[row_idx + 1][col_idx + 1] =
        matrix[row_idx][col_idx + 1] + matrix[row_idx + 1][col_idx]
      end
    end
    matrix.last.last
  end

  p unique_paths(3,7)
