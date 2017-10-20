# Implement pow(x, n).

def pow(x, n)
  return 1 if n == 0
  return x if n == 1

  if n > 1
    return x * pow(x, n - 1)
  else
    return pow(x, n + 1).fdiv(x)
  end

end
