# BankAccount Class

This project demonstrates a simple banking system using the `BankAccount` class in Dart.

## Features

- **BankAccount Class**:
  - Contains account ID and balance as instance variables.
  - Includes two constructors:
    - A primary constructor to initialize both `accountID` and `balance`.
    - A named constructor (`balance`) to initialize `accountID` with a default balance of `0`.
  - Provides methods for:
    - Depositing money.
    - Withdrawing money (with checks for validity and balance sufficiency).
    - Displaying account information.

## How to Run

1. Clone the repository to your local machine.
2. Open the Dart file (`main.dart`) in your preferred Dart environment (e.g., VS Code, IntelliJ IDEA, or DartPad).
3. Run the program to see the operations and results.

## Example Outputs

Welcome to our bank: 
Your Account Id is : 204566
Your Balance is : 15000.0
************************************************************************************
2000.0$ is withdrawed from your account successfully. Your balance is 13000.0$ .
************************************************************************************
Unvalid amount. please try again with correct amount.
************************************************************************************
0.0$ is deposited to your account successfully. Your balance is 13000.0$ now.
************************************************************************************
Unvalid amount. Please try again with correct amount.
************************************************************************************
Process Failed! 
The balance in your account is not enough to withdrawed 200000.0$ from your account. Your balance is 13000.0$ .
************************************************************************************

## Code Explanation

- The `BankAccount` class provides a simple representation of a bank account with basic operations.
- Each operation (deposit, withdrawal, and display) includes appropriate validation and user inform message.
- In the main we use the class functions with valid and invalid inputs.

## Repository Structure

- `main.dart`: The main Dart file containing the `BankAccount` class and test cases.
- `ReadMe.md`: This file, describing the project.
