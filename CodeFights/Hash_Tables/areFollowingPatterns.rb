def areFollowingPatterns(strings, patterns)
    pattern_hash = Hash.new {|h,k| h[k] = []}
    patterns.each_with_index do |pattern, idx|
        pattern_hash[pattern].push(idx)
    end

    string_hash = Hash.new {|h,k| h[k] = []}
    strings.each_with_index do |str, idx|
        string_hash[str].push(idx)
    end

    pattern_hash.values == string_hash.values
end
