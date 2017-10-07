#
# Say you have an array for which the ith element is the price of a given stock on day i.
#
# If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
#
# Example 1:
# Input: [7, 1, 5, 3, 6, 4]
# Output: 5
#
# max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
# Example 2:
# Input: [7, 6, 4, 3, 1]
# Output: 0
#
# In this case, no transaction is done, i.e. max profit = 0.


def max_prof(prices)
  lowest_seen = prices[0]
  return 0 unless lowest_seen
  best_prof = 0 #or nil, if negative profit allowed

  prices[1..-1].each do |price|
    current_prof = price - lowest_seen
    if best_prof.nil? || current_prof > best_prof
      best_prof = current_prof
    end

    lowest_seen = price if price < lowest_seen
  end
  best_prof
end
