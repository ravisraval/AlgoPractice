# Given an 2D board, count how many battleships are in it. The battleships are represented with 'X's, empty slots are represented with '.'s. You may assume the following rules:
#
# You receive a valid board, made of only battleships or empty slots.
# Battleships can only be placed horizontally or vertically. In other words, they can only be made of the shape 1xN (1 row, N columns) or Nx1 (N rows, 1 column), where N can be of any size.
# At least one horizontal or vertical cell separates between two battleships - there are no adjacent battleships.
# Example:
# X..X
# ...X
# ...X
# In the above board there are 2 battleships.
# Invalid Example:
# ...X
# XXXX
# ...X
# This is an invalid board that you will not receive - as battleships will always have a cell separating between them.
# Follow up:
# Could you do it in one-pass, using only O(1) extra memory and without modifying the value of the board?
#


# @param {Character[][]} board
# @return {Integer}
def count_battleships(board)
  visited = []
  count = 0

  board.each_with_index do |row, rowidx|
    row.each_with_index do |cell, colidx|

      next if visited.include?([rowidx, colidx])

      if cell == 'X'

        #add this cell
        count += 1
        visited.push([rowidx, colidx])

        #check right, if not, check down
        right = 1
        down = 1
        if board[rowidx][colidx + right] &&
           board[rowidx][colidx + right] == 'X'

          visited.push([rowidx, colidx + right])
          #keep checking right
          right += 1
          while board[rowidx][colidx + right] &&
                board[rowidx][colidx + right] == 'X'

            visited.push([rowidx, colidx + right])
            right += 1
          end
        #if not right, check down
        elsif board[rowidx + down] &&
              board[rowidx + down][colidx] == 'X'

          visited.push([rowidx + down, colidx])
          #keep checking down
          down +=  1
          while board[rowidx + down] &&
                board[rowidx + down][colidx] == 'X'

            visited.push([rowidx + down, colidx])
            down += 1
          end
        end

      end
    end
  end
  count
end


#faster

# @param {Character[][]} board
# @return {Integer}
def count_battleships(board)
  count = 0

  board.each_with_index do |row, rowidx|
    row.each_with_index do |cell, colidx|


      if cell == 'X' && (rowidx == 0 || board[rowidx - 1][colidx] == '.') &&
          (colidx == 0 || board[rowidx][colidx - 1] == '.')
          count += 1
      end
    end
  end
  count
end
