# Given numRows, generate the first numRows of Pascal's triangle.
#
# For example, given numRows = 5,
# Return
#
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]
# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows == 0
  return [[1]] if num_rows == 1

  rows = [[1], [1,1]]

  until rows.length >= num_rows
    next_row = [1]

    rows.last.each_index do |idx|
      break if idx == rows.last.length - 1
      jdx = idx + 1
      next_row.push(rows.last[idx] + rows.last[jdx])
    end

    next_row.push(1)
    rows.push(next_row)
  end

  rows
end
