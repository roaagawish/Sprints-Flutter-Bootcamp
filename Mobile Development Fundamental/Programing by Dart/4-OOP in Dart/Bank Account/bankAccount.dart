// Create a BankAccount class with two variables accountID and balance
class BankAccount {
  String accountID ;
  double _balance ;
  
//define constructor for the accountID and balance
  BankAccount(this.accountID , this._balance);
//define named constructor for the balance and initializes it to 0 and accepts only accountID
  BankAccount.balance( this.accountID) :  _balance = 0.0 ;
  
//withdraw method to take amount and deduct the amount from the user balance.
  void withdraw (double amount) {
    // make sure the amount is valid positive.
    if (amount > 0 ) { 
    // check if the amount is less than the balance
     if (amount <= _balance ) {   
        // withdraw from the balance
        _balance -= amount; 
        // information message
        print("$amount\$ is withdrawed from your account successfully. Your balance is $_balance\$ .");
        print("************************************************************************************");
      } else {
        // error message in case the amount is more than the balance
        print("Process Failed! \nThe balance in your account is not enough to withdrawed $amount\$ from your account. Your balance is $_balance\$ .");
        print("************************************************************************************");
      }
    } else {
      // error message in case the amount is unvalid
      print("Unvalid amount. Please try again with correct amount.");
      print("************************************************************************************");
    }
  } 

//deposit method to take amount and add the amount to the user balance.
 void deposit (double amount) {
  // make sure the amount is valid positive.
  if ( amount >= 0 ) { 
    // add it to the balance 
    _balance += amount; 
   // information message 
   print("$amount\$ is deposited to your account successfully. Your balance is $_balance\$ now.");
   print("************************************************************************************");
  } else {
    // error message in case the amount is unvalid
    print("Unvalid amount. please try again with correct amount.");
    print("************************************************************************************");
  }
 }

// displayAccountInfo method to print the account ID and the current balance.
 void displayAccountInfo() {
  print("Welcome to our bank: ");
  print("Your Account Id is : $accountID");
  print("Your Balance is : $_balance");
  print("************************************************************************************");
 }

}