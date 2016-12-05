// the classic matching brackets challenge.
// my approach was to search through the array looking for pairs'{}', '[]' or '()' and remove them. 
// Repeat until there are no remaining chars.
// This is definitely not the most time-efficient solution, but I solved this for a timed challenge, so I'll go back and work on a better solution soon.


function matching_brackets(values) {
    var answer = [];
    values.map(function(element){
      var again = true;
      element = element.split("");
        
      while (again !== false) {
        again = false;
        for(i=0; i<element.length; i+=1){
          
          switch(element[i] + element[i+1]){
            case '{}' :
              element.splice(i,2);
              again = true;
              break;
            case '[]' :
              element.splice(i,2);
              again = true;
              break;
            case '()' :
              element.splice(i,2);
              again = true;
              break;
          }
        }
      }
  
        element.length === 0 ? answer.push("YES") : answer.push("NO");
    });
    
    return (answer);
}


var tests = ["{}{{}}[][()]", "{(})"];

matching_brackets(tests);
// expect return of ["YES", "NO"]
