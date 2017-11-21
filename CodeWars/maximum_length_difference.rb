def mxdiflg(a1, a2)
  return -1 if a1.empty? && a2.empty?

  low1 = a1[0].length
  high1 = a1[0].length
  low2 = a2[0].length
  high2 = a2[0].length

  a1.each do |str|
    low1 = str.length if str.length < low1
    high1 = str.length if str.length > high1
  end

  a2.each do |str|
    low2 = str.length if str.length < low2
    high2 = str.length if str.length > high2
  end

  [(high1 - low2).abs, (low1 - high2).abs].max

end
