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

# find_longest_palindrome_test


test_string = "After early May, no more rain came to the red and gray country of Oklahoma. Soon the earth crusted and clouds of dust surrounded all moving objects. Midway through June, a few storm clouds teased the country but dropped very little rain. The wind became stronger and soon the dust hung in the air like fog. People were forced to tie handkerchiefs over their faces and wear goggles over their eyes.When the wind stopped, the men and women came out to survey the damage to the fields. Everyone, even the children, was subdued. They were waiting for the reaction of the men, to see whether they would break. The men did not break, but began figuring how to deal with the ruined corn. The women resumed their housework and the children their play, for they knew as long as the men were okay, the family would be fine.AnalysisChapter 1 establishes the epic context and tone for the entire novel. This brief, but important, opening chapter provides a backdrop for the main events of the narrative, describing the event primarily responsible for spurring the great migration to California during the 1930s. The destructive force of the Dust Bowl is staggeringly described as a backward life cycle, a regression from fertile green to a dead and dusty brown. The deterioration of the land that forces the farmers to huddle and figger foreshadows the plight of the Joads: Forced off their land by a bank looking for profit, they will move west seeking a new livelihood. The beautifully apocalyptic description of the slow spread of decay throughout the Oklahoma country is strongly influenced by the King James Bible and sets the brooding and oppressive tone of the novel.The opening chapter also introduces many of the themes that will be played out throughout the course of the novel. The suggestion of unity and human dignity in the huddled circle of men will be developed in the narrative. Likewise, the theme of survival, particularly survival in the face of environmental destruction, is implied by the refusal of the men to break. This theme, too, will be examined in detail in the narrative chapters.Chapter 1 is the first of the so-called intercalary chapters, inserted between the narrative chapters, which are generalized accounts of the social, economic, and historical situations that shape the events of the novel. These chapters provide significant commentary on the narrative elements of the novel and establish that this story is not one of an isolated group of individuals. The Joads' troubles — dispossessed, stripped of dignity, and struggling to maintain familial unity — are not unique to their family, but representative of an entire population of migrating people. Throughout the novel, the broad events of these intercalary chapters will be brought into sharp, personalized focus by the specific plight of the Joad family.Glossaryperplexity the condition of being perplexed; bewilderment; confusion.hams a) the backs of the thighs; b) the thighs and buttocks together."


p "Start at #{Time.now}"
find_longest_palindrome(test_string)
p "End at #{Time.now}"

# The instructions were pretty basic, so I have made a few assumptions.
# 1- that capitalization shouldn't affect the answer ('A' should be ecaluated the same as 'a')
# 2- that only alphabetic chars are to be considered. Removal of punctuation, numbers, etc...
# 3- that index and length are calculated after removal of non-alphabetic chars
# 4- that an empth string evaluates to longest_palindrome_start_index -1 and longest_palindrome_length 0
# 5- that the first longest palindrome is what should be returned

# If either 1 or 2 are incorrect assumptions, "text = text.downcase.gsub(/[^a-z]/i, '').split("")" can be replaced with "text = text.split("")" and everything will still work correctly.



# added a second solution. A different approach utilizing the ".each_cons" method

def find_longest_palindrome(text)
  text = text.downcase.gsub(/[^a-z]/i, '')
  text_arr = text.split("")
  size = text.length
  answer_string = nil
  
  until answer_string do
    
    if size < 1 
      return [0, -1]
    end
    
    text_arr.each_cons(size) do |a| 
      is_palindrome?(a.join) ? answer_string = a.join : next
    end
    
    size-=1
  end
  
  [text.index(answer_string), answer_string.length]
end

def is_palindrome?(string)
  string == string.reverse
end


