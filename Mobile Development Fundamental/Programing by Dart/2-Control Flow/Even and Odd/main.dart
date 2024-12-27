void main() {
  // Define a list of numbers
  List numbers = [3 , 5 , 2 , -7 , 0 , 1 , 10 , 33 , -22 , 100 , 99];

  int result ;

   // Iterate through the list using a for loop 
  for (int i in numbers) {
    result = i % 2 ; // condiont to determine if the number is even or odd

    // Use a switch case to determine if the number is even or odd
    switch  (result) {
      case 0 :   // Case for even numbers
      print("$i is even");
      break;

      case 1 :   // Case for odd numbers
      print("$i is odd");
      break;

      default:
      print("Unvalid Number");
    }
  }
}