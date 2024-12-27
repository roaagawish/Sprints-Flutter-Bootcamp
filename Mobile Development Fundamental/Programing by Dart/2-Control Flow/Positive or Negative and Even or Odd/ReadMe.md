# Positive/Negative and Even/Odd Checker

This project determines whether a given number is positive, negative, or zero, and whether it is even or odd.

## Features

- Accepts an integer input from the user.
- Checks if the number is positive, negative, or zero.
- Checks if the number is even or odd using the modulo operator (`%`).

## How to Run

1. Clone the repository to your local machine.
2. Open the Dart file (`main.dart`) in your preferred Dart environment (e.g., VS Code, IntelliJ IDEA, or DartPad).
3. Run the program and input an integer number when asked.

## Example Outputs

1. Input: `5`
5 is positive. 
5 is odd.

2. Input: `-8`
-8 is negative. 
-8 is even.

3. Input: `0`
0 is zero. 
0 is even.


## Code Explanation

- The program uses the `stdin.readLineSync()` function to accept user input.
- The `tryParse()` method ensures the input is a valid integer.
- Two conditions determine:
- Whether the number is positive, negative, or zero.
- Whether the number is even or odd by checking the remainder (`number % 2`).

## Repository Structure

- `main.dart`: The Dart file containing the program code.
- `ReadMe.md`: This file, describing the project.

## Notes

- Ensure the input is an integer. Non-integer inputs will result in an error message.

