# Write a function to find the longest common prefix string amongst an array of strings.


def longest_common_prefix(strs)
    return "" if strs.empty?
    longest_common = strs[0]
    longest_length = strs[0].length

    strs[1..-1].each do |str|
        longest_length.downto(0).each do |terminus|
            if str[0...terminus] == longest_common[0...terminus]
                longest_common = str[0...terminus]
                longest_length = terminus
                break
            end
        end
    end
    longest_common
end
