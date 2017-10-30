# Given n, how many structurally unique BST's (binary search trees) that store values 1...n?
#
# For example,
# Given n = 3, there are a total of 5 unique BST's.
#
#    1         3     3      2      1
#     \       /     /      / \      \
#      3     2     1      1   3      2
#     /     /       \                 \
#    2     1         2                 3
# @param {Integer} n
# @return {Integer}
def num_trees(n)
     re = [1]
     1.upto(n + 1) do |i|
        re[i] = 0
        0.upto(i - 1) do |j|
            re[i] += re[j] * re[i - 1 - j]
        end
    end
    re[n]
end
