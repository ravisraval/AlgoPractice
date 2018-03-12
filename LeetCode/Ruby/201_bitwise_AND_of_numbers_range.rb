# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
  powers = []
  31.times { |num| powers.push(2**num) }
  return 0 if powers.any? { |power| power.between?(m, n) }
  start = m
  (m + 1).upto(n).each do |num|
    start &= num
  end
  start
end
