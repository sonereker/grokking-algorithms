# O(n2)
def selection_sort(arr)
  new_arr = []
  (arr.size - 1).times do
    smallest_index = find_smallest(arr)
    new_arr << arr.delete_at(smallest_index)
    p new_arr
  end
  new_arr
end

def find_smallest(arr)
  smallest = arr[0]
  smallest_index = 0
  (1..(arr.size - 1)).each do |i|
    if arr[i] < smallest
      smallest = arr[i]
      smallest_index = i
    end
  end

  smallest_index
end

p selection_sort([121, 213_213, 5, 3, 6, 2, 10, 9])
