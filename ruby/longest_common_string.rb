# https://livebook.manning.com/book/grokking-algorithms/chapter-9/1

def longest_common_string_length(word_a, word_b)
  grid = []
  for i in 0..word_a.length - 1
    grid[i] = []
    for j in 0..word_b.length - 1
      if word_a[i] == word_b[j]
        if i < 1 || j < 1
          grid[i][j] = 1
        else
          grid[i][j] = grid[i - 1][j - 1] + 1
        end
      else
        grid[i][j] = 0
      end
    end
  end

  p grid

  values = []
  grid.each { |inner| values << inner.max }
  values.max
end

# [[1, 0, 0, 0, 0],
#  [0, 0, 0, 0, 0],
#  [0, 0, 1, 0, 0],
#  [0, 0, 0, 2, 0],
#  [0, 1, 0, 0, 3]]

p longest_common_string_length('ofish', 'ohish')
