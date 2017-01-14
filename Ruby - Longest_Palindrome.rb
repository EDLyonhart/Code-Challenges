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
  # test_string = "A man, a plan, a canal - Panama!" # expect : [0, 21]
  # test_string = "" # expect : [-1, 0]
  # test_string = "x" # expect : [0, 1]
  test_string = "@%!!!#..,@$" # expect : [-1, 0]
  
  find_longest_palindrome(test_string)
end

find_longest_palindrome_test