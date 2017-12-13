def rotateImage(a)
    res = Array.new(a.length) { Array.new(a.length) }
    a.each_with_index do |row, rowidx|
        row.each_with_index do |cell, colidx|
            res[colidx][(rowidx - (a.length - 1)).abs] = cell
        end
    end
    res
end
