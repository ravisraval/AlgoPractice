# Say you have an array for which the ith element is the price of a given stock on day i.
#
# Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  sum = 0
  return sum if prices.empty?

  curr_low = prices[0]

  prices[1..-1].each do |price|
    if price < curr_low
      curr_low = price
    elsif price > curr_low
      sum += price - curr_low
      curr_low = price
    end
  end
  sum


end
