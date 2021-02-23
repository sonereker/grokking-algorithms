# O(log n)
def binary_search(list, item)
  low = 0
  high = list.size - 1

  while low <= high
    mid = (low + high) / 2
    p "Low: #{low} High: #{high} Mid: #{mid}"
    guess = list[mid]
    p "Guess: #{guess}"
    return mid if guess == item

    if guess > item
      high = mid - 1
    else
      low = mid + 1
    end
  end

  nil
end

p binary_search([1, 4, 5, 9, 10, 101, 123, 45_435], 101)
