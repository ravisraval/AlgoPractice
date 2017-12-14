def almostIncreasingSequence(sequence)
   return false unless sequence.length - sequence.uniq.length <= 1

   sequence.each_with_index do |n,idx|
      removed_seq = sequence[0...idx] + sequence[idx + 1..-1]
      return true if good(removed_seq)
   end

   false
end

def good(removed_seq)
   prev = removed_seq.first
   removed_seq[1..-1].each do |n|
      return false unless n > prev
      prev = n
   end
   true
end
