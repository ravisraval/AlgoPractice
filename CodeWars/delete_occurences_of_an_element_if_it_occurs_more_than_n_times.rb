def delete_nth(order,max_e)
  seen = Hash.new(0)
  idx = 0
  res = []
  while idx < order.length
    unless seen[order[idx]] == max_e
      seen[order[idx]] += 1
      res.push(order[idx])
    end
    idx += 1
  end
  res
end
