#
# Given an index k, return the kth row of the Pascal's triangle.
#
# For example, given k = 3,
# Return [1,3,3,1].
#
# Note:
# Could you optimize your algorithm to use only O(k) extra space?
# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  return [1] if row_index == 0
  return [1,1] if row_index == 1
  prev = [1,1]
  count = 1

  until count == row_index
    next_row = [1]

    prev.each_index do |idx|
      next if idx == prev.length - 1
      next_row.push(prev[idx] + prev[idx + 1])
    end

    next_row.push(1)
    prev = next_row
    count += 1
  end
  prev
end
