/*

www.hackerrank.com/challenges/lonely-integer

find and print out any unique elements

  The first line contains a single integer, N, denoting the number of integers in the array. 
  The second line contains N space-separated integers describing the respective values in A.

Big-O notation of this solution is O(n)

alternative solutions include a brute force, double loop looking for similar ints and moving on when one is found. 
  Big-O of that would be O(n^2)

*/

function processData(input) {
  answer_object = {};

  input = input.split("\n")[1].split(" ");

  input.forEach(function(element) { 
    answer_object[element] ?  answer_object[element]+=1 : answer_object[element] = 1;
  });

  for (var prop in answer_object) { 
    if (answer_object[prop] == 1) { console.log(prop); }
  }
} 



input = "5\n1 1 2 2 3";

processData(input);