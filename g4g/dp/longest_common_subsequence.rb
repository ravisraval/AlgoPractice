# We have discussed Overlapping Subproblems and Optimal Substructure properties in Set 1 and Set 2 respectively. We also discussed one example problem in Set 3. Let us discuss Longest Common Subsequence (LCS) problem as one more example problem that can be solved using Dynamic Programming.
#
# LCS Problem Statement: Given two sequences, find the length of longest subsequence present in both of them. A subsequence is a sequence that appears in the same relative order, but not necessarily contiguous. For example, “abc”, “abg”, “bdf”, “aeg”, ‘”acefg”, .. etc are subsequences of “abcdefg”. So a string of length n has 2^n different possible subsequences.
#
# It is a classic computer science problem, the basis of diff (a file comparison program that outputs the differences between two files), and has applications in bioinformatics.
#
# Examples:
# LCS for input Sequences “ABCDGH” and “AEDFHR” is “ADH” of length 3.
# LCS for input Sequences “AGGTAB” and “GXTXAYB” is “GTAB” of length 4

################   Start recursive solution ###############
def strip(aa, bb)
  idx = 0
  while idx < aa.length
    unless bb.include?(aa[idx])
      aa.delete_at(idx)
    else
      idx += 1
    end
  end
  idx = 0
  while idx < bb.length
    unless aa.include?(bb[idx])
      bb.delete_at(idx)
    else
      idx += 1
    end
  end
  [aa, bb]
end

def find_combos(a, b)
  return 0 if a.empty? || b.empty?
  return 1 if a.length == 1 && b.length == 1 && a[0] == b[0]

  return 1 + find_combos(a[0..-2], b[0..-2]) if a.last == b.last
  [find_combos(a, b[0..-2]), find_combos(a[0..-2], b)].max
end

def recurse(a, b)
  aa = a.split('')
  bb = b.split('')
  stripped_aa, stripped_bb = strip(aa, bb)
  find_combos(stripped_aa, stripped_bb)
end

# p recurse('ab12c3', '452c3')
############# End recursive solution ###################

################   Start memo solution ###############
def strip1(aa, bb)
  idx = 0
  while idx < aa.length
    unless bb.include?(aa[idx])
      aa.delete_at(idx)
    else
      idx += 1
    end
  end
  idx = 0
  while idx < bb.length
    unless aa.include?(bb[idx])
      bb.delete_at(idx)
    else
      idx += 1
    end
  end
  [aa, bb]
end

def find_combos1(a, b, memo = {})
  return memo[[a,b]] if memo.key?([a, b])

  if a.empty? || b.empty?
    memo[[a, b]] = 0
    return 0
  end
  if a.length == 1 && b.length == 1 && a[0] == b[0]
    memo[[a,b]] = 1
    return 1
  end

  return 1 + find_combos1(a[0..-2], b[0..-2], memo) if a.last == b.last
  memo[[a, b[0..-2]]] = find_combos1(a, b[0..-2])
  memo[[a[0..-2], b]] = find_combos1(a, b[0..-2])
  [memo[[a, b[0..-2]]], memo[[a[0..-2], b]]].max
end

def recurse1(a, b)
  aa = a.split('')
  bb = b.split('')
  stripped_aa, stripped_bb = strip(aa, bb)
  find_combos1(stripped_aa, stripped_bb)
end

# p recurse1('ab12c3', '452c3')

################# End memo solution ###############
b = Time.now
2.times { recurse1('abahyfioasuhdf12734jhdc3', 'kasjdsjdhfklja452c4') }
1000.times { recurse1('ab12c3', '452c4') }
p Time.now - b

a = Time.now
2.times { recurse('abahyfioasuhdf12734jhdc3', 'kasjdsjdhfklja452c4') }
1000.times { recurse('ab12c3', '452c4') }
p Time.now - a
