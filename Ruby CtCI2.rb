'''
Given a small string (s) and a bigger string (b), design an algorithy to find all permutations of s within b. 
Print the location of each permutation.

My solution is:
  create a an array of all permutations of (s)
  create a hash { key = index, value = b[index .. index+s_length] }
  compare each value against array of (s) permutations
  print index if theres a match.

The big O notation of this is...
  creating the dictionary_hash will be O(b)
  searching through the dictionary is the bottle neck.

  Other possiblity: I know that Hashes have very quick lookup speed. So maybe key is the "abbc" and value is index?
'''


def function(s, b)
  dictionary_hash = Hash.new
  
  s_length = s.length
  s_permu = s.split("").permutation.to_a
  s_permu.each_with_index { |arr, index| s_permu[index] = arr.join }
  
  b.split("").each_with_index { |char, index|
    dictionary_hash[index] = b[index...index + s_length]
  }

  dictionary_hash.each { |key, value|
    if s_permu.include?(value)
      p key
    end
  }
end

function("abbc", "cbabadcbbabbcbabaabccbabc")
