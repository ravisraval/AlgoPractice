def simplifyPath(path)
    stack = []
    path = path.split('')

    idx = 0
    while idx < path.length
        if !'/.'.include?(path[idx])
            jdx = idx
            jdx += 1 until path[jdx + 1].nil? || '/.'.include?(path[jdx + 1])
            stack.push(path[idx..jdx].join(''))
            idx = jdx + 1
        elsif path[idx] == '.' && path[idx + 1] == '.'
            stack.pop
            idx += 2
        end

        idx += 1
    end
    stack.join('/').split("").unshift('/').join("")

end

simplifyPath('/////..///K/BruP/RMplU/././')
