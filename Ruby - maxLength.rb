'''
This is a method to find the maximum number of elements in an array (a) which are equal or less than value (k)
Print the number of elements


Brute Force: O(n^2) Form a double loop looking at all combinations. if a better one is found, set it.
'''

def maxLength(a, k) 

  a = a.to_a
  answer, i, j = 0, 0, 0
    
  a.size.times do
    a.size.times do
      total = a[i..j].reduce(:+)
      length = a[i..j].size

      if total && (total <= k) && (length > answer)
        answer = length
      end
      j+=1
    end
    i+=1
  end

  p answer
end


# maxLength([1,2,3], 4)  # expected: 2
# maxLength([3,1,2,1], 4)  # expected: 3
# maxLength([2,1,1,1,1,2,1,1,1,2,1,1], 6)  # expected: 6
# maxLength([ ], 0)  # expected: 0
# maxLength([ ], 15)  # expected: 0
# maxLength([2,3,4,5], 1)  # expected: 0



