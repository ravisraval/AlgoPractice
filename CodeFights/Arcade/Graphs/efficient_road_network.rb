def efficientRoadNetwork(n, roads)
    road_hsh = Hash.new { |h,k| h[k] = [] }


    roads.each do |road|
        road_hsh[road[1]].push(road[0])
        road_hsh[road[0]].push(road[1])
    end

    n.times do |city|
        return false unless depth_ok?(city, road_hsh, n)
    end

    true
end

def depth_ok?(city, road_hsh, n)
    visited = []

    node_stack = [[city, 0]]

    until node_stack.empty?
        node, depth = node_stack.pop
        visited.push(node) unless visited.include?(node)

        if depth < 2
            road_hsh[node].each do |neighbor_city|
                next if visited.include?(neighbor_city)
                node_stack.push([neighbor_city, depth + 1])
            end
        end
    end

    return false if visited.length <= n - 1

    true
end

# Once upon a time, in a kingdom far, far away, there lived a king Byteasar III. As a smart and educated ruler, he did everything in his (unlimited) power to make every single system of his kingdom efficient. The king went down in history as a great road builder: during his reign a great number of roads were built, and the road system he created was the most efficient for those dark times.
#
# When you started to learn about Byteasar's III deeds in your history classes, the creeping doubt crawled into the back of your mind: what if the famous king wasn't so great after all? According to the most recent studies, there were n cities in the Byteasar's kingdom, which were connected by the two-ways roads. You managed to get information about this roads from the university library, so now you can write a function that will determine whether the road system in Byteasar's kingdom was efficient or not.
#
# A road system is considered efficient if it is possible to travel from any city to any other city by traversing at most 2 roads.
#
# Example
#
# For n = 6 and
#
# roads = [[3, 0], [0, 4], [5, 0], [2, 1],
#           [1, 4], [2, 3], [5, 2]]
# the output should be
# efficientRoadNetwork(n, roads) = true.
#
# Here's how the road system can be represented:
#
#
# For n = 6 and
#
# roads = [[0, 4], [5, 0], [2, 1],
#           [1, 4], [2, 3], [5, 2]]
# the output should be
# efficientRoadNetwork(n, roads) = false.
#
# Here's how the road system can be represented:
#
#
# As you can see, it's only possible to travel from city 3 to city 4 by traversing at least 3 roads.
#
# Input/Output
#
# [time limit] 7000ms (rb)
#
# [input] integer n
#
# The number of cities in the kingdom.
#
# Guaranteed constraints:
# 1 ≤ n ≤ 250.
#
# [input] array.array.integer roads
#
# Array of roads in the kingdom. Each road is given as a pair [cityi, cityj], where 0 ≤ cityi, cityj < n and cityi ≠ cityj. It is guaranteed that no road is given twice.
#
# Guaranteed constraints:
# 0 ≤ roads.length ≤ 35000,
# roads[i].length = 2,
# 0 ≤ roads[i][j] < n.
#
# [output] boolean
#
# true if the road system is efficient, false otherwise.
#
