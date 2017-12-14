def phoneCall(min1, min2_10, min11, s)
    min_count = 0

    s -= min1
    min_count += 1
    if s < 0
        return 0
    end

    9.times do |time|
        s -= min2_10
        return min_count if s < 0
        min_count += 1
    end

    loop do
        s -= min11
        return min_count if s < 0
        min_count += 1
    end

end
