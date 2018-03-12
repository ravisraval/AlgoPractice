# Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
#
# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous row.
# For example,
#
# Consider the following matrix:
#
# [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# Given target = 3, return true.

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    # trying to avoid matrix.flatten
    if matrix.length < 3
        return matrix.flatten.include?(target)
    end
    total_length = matrix.length * matrix[0].length
    pivot = total_length / 2
    pivot_rowidx = pivot / matrix[0].length
    pivot_colidx = pivot % (matrix[0].length * pivot_rowidx)

    piv_num = matrix[pivot_rowidx][pivot_colidx]

    if piv_num == target
        return true
    elsif piv_num > target
        return search_matrix(matrix[0..pivot_rowidx], target)
    else
        return search_matrix(matrix[pivot_rowidx..-1], target)
    end
end
