# All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.
#
# Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.
#
# For example,
#
# Given s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT",
#
# Return:
# ["AAAAACCCCC", "CCCCCAAAAA"].
# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  counts = Hash.new(0)
  start_idx = 0
  last_idx = 9

  while last_idx < s.length
    counts[s[start_idx..last_idx]] += 1
      start_idx += 1
      last_idx += 1
  end
  
  counts.select { |k, v| v > 1}.keys
end
