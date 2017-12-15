def minesweeper(matrix)
    res = Array.new(matrix.length) { Array.new(matrix[0].length) }

    matrix.each_with_index do |row, rowidx|
        row.each_with_index do |cell, colidx|
            res[rowidx][colidx] = get_num(matrix, rowidx, colidx)
        end
    end

    res
end

def get_num(matrix, rowidx, colidx)
    count = 0

    #row above
    if rowidx > 0
        if colidx > 0 && matrix[rowidx - 1][colidx - 1] == true
            count += 1
        end
        count += 1 if matrix[rowidx - 1][colidx] == true
        if matrix[rowidx].length - 1 > colidx &&
            matrix[rowidx - 1][colidx + 1] == true
            count += 1
        end
    end

    #same row
    if colidx > 0 && matrix[rowidx][colidx - 1] == true
        count += 1
    end
    if matrix[rowidx].length - 1 > colidx &&
        matrix[rowidx][colidx + 1] == true
        count += 1
    end

    #row below
    if matrix.length - 1 > rowidx #row below
        if colidx > 0 && matrix[rowidx + 1][colidx - 1] == true
            count += 1
        end
        count += 1 if matrix[rowidx + 1][colidx] == true
        if matrix[rowidx].length - 1 > colidx &&
            matrix[rowidx + 1][colidx + 1] == true
            count += 1
        end
    end
    count
end
