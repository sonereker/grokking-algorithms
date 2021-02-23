def longest_common_subsequence_length(word_a, word_b)
  grid = []
  (0..word_a.length - 1).each do |i|
    grid[i] = []
    (0..word_b.length - 1).each do |j|
      if i < 1 || j < 1
        grid[i][j] = 1
        next
      end

      grid[i][j] = if word_a[i] == word_b[j]
                     grid[i - 1][j - 1] + 1
                   else
                     [grid[i - 1][j], grid[i][j - 1]].max
                   end
    end
  end

  p grid

  values = []
  grid.each { |inner| values << inner.max }
  values.max
end

# [[1, 1, 1, 1],
#  [1, 1, 1, 1],
#  [1, 1, 2, 2],
#  [1, 1, 2, 3]]

p longest_common_subsequence_length('fish', 'fosh')
