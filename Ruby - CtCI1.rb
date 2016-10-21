'''
given an array of unique integers, find the paris with a difference of k

1) Brute force: 2 loops compare each element against every other element.
2) Slight optimization: use '.sort' method, and look for difference of "arr[i+1] - arr[i] == k"
3) Optimizeder: Create Hash of each element of array [{element => element+k}, ... ] see if values exist in original array.
'''

#2 O(N log(N))
def function(arr, k)
  answer = Array.new
  arr = arr.sort
  arr.each_with_index { |val, i|

    if val+k == arr[i+1]
      answer << [val, arr[i+1]]
    end
  }
  answer
end

function([1,7,5,9,12,3], 2)
# yields => [[1, 3], [3, 5], [5, 7], [7, 9]]

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#3 O(N)
def function(arr, k)
  hash_table, answer = Hash.new, Array.new

  arr.each do |element|
    hash_table[element] = (element+k)
  end
  
  arr.map { |element|
    if hash_table.has_value?(element)
      answer << [element-k, element]
    end
  }
  answer
end

function([1,7,5,9,12,3], 2)
# yields => [[5, 7], [3, 5], [7, 9], [1, 3]]