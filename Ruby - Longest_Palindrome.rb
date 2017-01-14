# __The Palindrome Problem__

# We need an algorithm that returns the size and index of the longest palindrome in a blob of text.  A 
# palindrome is a word that can be read forwards or backwards, like "mom", "abba", or "yay".  

# Signature:
# find_longest_palindrome(TEXT) -> [longest_palindrome_start_index, longest_palindrome_length]

# Hints:
# 1. Start with a simple solution that finds the first palindrome in a string.
# 2. Don't forget that palindromes can be odd ("mom") or even ("abba").


def find_longest_palindrome(text)
  text = text.downcase.gsub(/[^a-z]/i, '').split("")
  
  answer_hash = create_answer_hash(text)
  p parse_answer_hash(answer_hash)
end

def create_answer_hash(text)
  answer_hash = Hash.new

  text.each_with_index do |char, index|
    i = 1
    (text.length-index).times do
      if answer_hash[index]
        answer_hash[index] << text[index..index+i].join
        i+=1
      else
        answer_hash[index] = [char]
      end
    end
  end
  
  answer_hash
end

def parse_answer_hash(answer_hash)
  answer = [-1, 0]

  answer_hash.each do |key, value|
    value.each do |sub_string|
      if (sub_string.length > answer[1] && is_palindrome?(sub_string))
        answer[0] = key
        answer[1] = sub_string.length
      end
    end
  end
  
  answer
end

def is_palindrome?(string)
  string == string.reverse
end


def find_longest_palindrome_test
  # test_string = "abba" # expect : [0, 4]
  # test_string = "A man, a plan, a canal - Panama!" # expect : [0, 21] or [6,3] if considering all chars
  # test_string = "" # expect : [-1, 0]
  # test_string = "x" # expect : [0, 1]
  # test_string = "@%!!!#..,@$" # expect : [-1, 0] or [2, 3] if non-alphabetic chars are accepted
  test_string = "abbadcabba" # expect : [0, 4] or [[0,4],[6,4]] if all instances are requested
  
  find_longest_palindrome(test_string)
end

find_longest_palindrome_test


# The instructions were pretty basic, so I have made a few assumptions.
# 1- that capitalization shouldn't affect the answer ('A' should be ecaluated the same as 'a')
# 2- that only alphabetic chars are to be considered. Removal of punctuation, numbers, etc...
# 3- that index and length are calculated after removal of non-alphabetic chars
# 4- that an empth string evaluates to longest_palindrome_start_index -1 and longest_palindrome_length 0
# 5- that the first longest palindrome is what should be returned

# If either 1 or 2 are incorrect assumptions, "text = text.downcase.gsub(/[^a-z]/i, '').split("")" can be replaced with "text = text.split("")" and everything will still work correctly.





