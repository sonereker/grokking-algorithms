# https://livebook.manning.com/book/grokking-algorithms/chapter-9/1

def longest_common_subsequence_length(word_a, word_b)
  grid = []
  for i in 0..word_a.length - 1
    grid[i] = []
    for j in 0..word_b.length - 1
      if i < 1 || j < 1
        grid[i][j] = 1
        next
      end

      if word_a[i] == word_b[j]
        grid[i][j] = grid[i - 1][j - 1] + 1
      else
        grid[i][j] = [grid[i - 1][j], grid[i][j - 1]].max
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
