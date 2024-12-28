import 'bankAccount.dart';

void main() {

  BankAccount client1 = new BankAccount("204566", 15000.00);

  client1.displayAccountInfo();
  client1.withdraw(2000);
  client1.deposit(-100);
  client1.deposit(0);
  client1.withdraw(-200);
  client1.withdraw(200000);

 BankAccount client2 = new BankAccount.balance("854672");

  client2.displayAccountInfo();
  client2.withdraw(2000);
  client2.deposit(-100);
  client2.deposit(10000);
  client2.withdraw(-200);
  client2.withdraw(200);


}