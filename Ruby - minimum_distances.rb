'''
problem from : https://www.hackerrank.com/challenges/minimum-distances

find the distance between two closest duplicate integers in an array.
if no duplicates, return "-1"
'''


def find_duplicates(array)
  hash_of_input = Hash.new

  array.each_with_index do |element, index|
    # if integer does exist as a key, add the next index to the array
    # if integer doesnt exist as a key, val = [index]
    hash_of_input[element] ? hash_of_input[element] << index : hash_of_input[element] = [index]
  end
  hash_of_input
end

def find_distances(hash_of_input)
  # initialize default answer
  answer = -1
  hash_of_input.each do |entry|
    # only check entries with multiple occurances
    if entry[1].size > 1
      i = 0
      # for each set of indices, find the distance
      (entry[1].size-1).times do 
        compare = [entry[1][i+1],entry[1][i]]
        # find distance by subtracting two indices
        distance = compare.reduce(:-)
          
        if answer == -1
          answer = distance
        else
          # if the last answer is greater than the current one, reset it
          if answer > distance
            answer = distance
          end
        end 
        i+=1
      end
    end
  end
  p answer
end

a = [1,2,3,4,5,3,4,7,8,9,0,7]

hash_of_input = find_duplicates(a)
find_distances(hash_of_input)