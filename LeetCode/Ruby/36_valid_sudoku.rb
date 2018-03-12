# Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
#
# The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
#
#
# A partially filled sudoku which is valid.
#
# Note:
# A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.
#


# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
    sq = {
        0 => {},
        1 => {},
        2 => {},
        3 => {},
        4 => {},
        5 => {},
        6 => {},
        7 => {},
        8 => {}
        }
    pos_hash = Hash.new {|h,k| h[k] = []}
    board.each_with_index do |row, rowidx|
        row.each_with_index do |cell, colidx|

            unless cell == "."
                pos_hash[rowidx][colidx] = cell

                if rowidx < 3
                    if colidx < 3
                        return false if sq[0].has_key?(cell)
                        sq[0][cell] = true
                    elsif colidx < 6
                        return false if sq[1].has_key?(cell)
                        sq[1][cell] = true
                    else
                        return false if sq[2].has_key?(cell)
                        sq[2][cell] = true
                    end
                elsif rowidx < 6
                    if colidx < 3
                        return false if sq[3].has_key?(cell)
                        sq[3][cell] = true
                    elsif colidx < 6
                        return false if sq[4].has_key?(cell)
                        sq[4][cell] = true
                    else
                        return false if sq[5].has_key?(cell)
                        sq[5][cell] = true
                    end
                else
                    if colidx < 3
                        return false if sq[6].has_key?(cell)
                        sq[6][cell] = true
                    elsif colidx < 6
                        return false if sq[7].has_key?(cell)
                        sq[7][cell] = true
                    else
                        return false if sq[8].has_key?(cell)
                        sq[8][cell] = true
                    end
                end

            end
        end
    end
    # if pos_hash.any? { |row, vals| vals.uniq.length != vals.length }
    #     puts "row duplicate"
    #     return false
    # end



    # #check each row
    board.each do |row|
        row_hash = {}
        row.each do |cell|
            if row_hash[cell] && cell != "."
                return false
            end
            row_hash[cell] = true unless cell == "."
        end
    end

    #check each col
    board.each_index do |rowidx|
        col_hash = {}
        0.upto(8).each do |colidx|
            curr_cell = board[colidx][rowidx]
            if col_hash[curr_cell] && curr_cell != "."
                return false
            end
            col_hash[curr_cell] = true unless curr_cell == "."
        end
    end
    true

end 
