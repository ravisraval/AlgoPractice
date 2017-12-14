def pressingButtons(buttons)
    mapping = {
        '2' => ['a','b','c'],
        '3' => ['d','e','f'],
        '4' => ['g','h','i'],
        '5' => ['j','k','l'],
        '6' => ['m','n','o'],
        '7' => ['p','q','r','s'],
        '8' => ['t','u','v'],
        '9' => ['w','x','y','z']
        }
    res = []

    buttons.split("").each do |button|
        if res.empty?
            res = mapping[button]
        else
            tmp_arr = []
            res.each do |str|
                mapping[button].each do |ch|
                    tmp_arr.push(str + ch)
                end
            end
            res = tmp_arr
        end
    end
    res
end
