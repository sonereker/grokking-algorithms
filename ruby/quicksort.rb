# https://livebook.manning.com/book/grokking-algorithms/chapter-4/

def quicksort(numbers)
  return numbers if numbers.size < 2

  pivot = numbers[0]
  less_than_pivot = []
  greater_than_pivot = []

  numbers.each_with_index do |n, index|
    less_than_pivot << n if index != 0 && n < pivot
    greater_than_pivot << n if index != 0 && n > pivot
  end

  quicksort(less_than_pivot) + [pivot] + quicksort(greater_than_pivot)
end

p quicksort([10, 2, 19, 1, 11])
