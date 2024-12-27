void main() {
  // Define a list of integer numbers 
  List <int> numbers = [73,11,4,5,67,89,33,55,3,67,87,99,65,78,2];

  // call the function amd print the return of it
  print("The minimum value is : ${getMinimum(numbers)}");
}

// Create a function which take a list of integers loob around it and return the minimum value 
int getMinimum (List numbers) {
  int minimum = numbers[0]; 
  // loob around the list
  numbers.forEach((item) {
    // compare the first element by the rest 
    if (item < minimum ) {
     minimum = item ; // save the minimum value in a variable   
    } });
  // return the minimum value
  return minimum ;
}