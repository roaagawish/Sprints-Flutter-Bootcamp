import 'bankAccount.dart';

void main() {

 // Create an account using the primary constructor
  BankAccount client1 = new BankAccount("204566", 15000.00);

// Perform deposit and withdrawal operations 
  client1.displayAccountInfo();
  client1.withdraw(2000); // valid withdrawal
  client1.deposit(-100); // unvalid deposit
  client1.deposit(0); // valid deposit
  client1.withdraw(-200); // unvalid withdrawal 
  client1.withdraw(200000); // insufficient balance

// Create an account using the named constructor
 BankAccount client2 = new BankAccount.balance("854672");

// Perform deposit and withdrawal operations 
  client2.displayAccountInfo();
  client2.withdraw(2000); // insufficient balance
  client2.deposit(-100); // unvalid deposit
  client2.deposit(10000); // valid deposit
  client2.withdraw(-200); // unvalid withdrawal 
  client2.withdraw(200); // valid withdrawal

}