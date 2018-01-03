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

def brute(a, b)
  aa = a.split('')
  bb = b.split('')
  stripped_aa, stripped_bb = strip(aa, bb)
  find_combos(stripped_aa, stripped_bb)
end

p brute('ab12c3', '452c3')

################# End recursive solution ###############
