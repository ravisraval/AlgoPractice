def sudoku2(grid)
    grid.each do |row|
        return false unless isValid?(row.select { |ch| ch != '.'})
    end

    grid.length.times do |colidx|
        col = []
        grid.length.times do |rowidx|
            next if grid[rowidx][colidx] == '.'
            col.push(grid[rowidx][colidx])
        end
        return false unless isValid?(col)
    end

    square = []
    0.upto(2).each do |rowidx|
        0.upto(2).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    0.upto(2).each do |rowidx|
        3.upto(5).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    0.upto(2).each do |rowidx|
        6.upto(8).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    3.upto(5).each do |rowidx|
        0.upto(2).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    3.upto(5).each do |rowidx|
        3.upto(5).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    3.upto(5).each do |rowidx|
        6.upto(8).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    6.upto(8).each do |rowidx|
        0.upto(2).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    6.upto(8).each do |rowidx|
        3.upto(5).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    square = []
    6.upto(8).each do |rowidx|
        6.upto(8).each do |colidx|
            next if grid[rowidx][colidx] == '.'
            square.push(grid[rowidx][colidx])
        end
    end
    return false unless valid?(square)

    true
end

def valid?(arr)
    arr.flatten.delete(".")
    isValid?(arr)
end

def isValid?(arr)
    arr.uniq.length == arr.length
end
