import 'book.dart';
import 'library.dart';
import 'userd.dart';

void main() {
  //create instance from the library
  Library lib = new Library();
  // create some books
  Books book1 = new   Books("01","book1", false);
  Books book2 = new   Books("02","book2", true);
  Books book3 = new   Books("03","book3", false);
  Books book4 = new   Books("04","book4", true);
 // create some users
  Userd user1 = new    Userd("8769", "roaa");
  Userd user2 = new    Userd("6789", "ayman");
  Userd user3 = new    Userd("2334", "ali");
  Userd user4 = new    Userd("5788", "dina");
  Userd user5 = new    Userd("2092", "rana");
  // add the books to the library list
  lib.addBook(book1);
  lib.addBook(book2);
  lib.addBook(book3);
  lib.addBook(book4);
 // add the users to the library list 
  lib.addUser(user1);
  lib.addUser(user2);
  lib.addUser(user3);
  lib.addUser(user4);
  lib.addUser(user5);
  
 // borrow some books
   lib.borrowBook("01",  "8769", "roaa"); // found book
   lib.borrowBook("02",  "8769", "roaa"); // already borrowed before
   lib.borrowBook("05",  "8769", "roaa"); // not found in the library

   lib.returnBook("01"); // return borrowed book
   lib.returnBook("03"); // book is not borrowed yet
   lib.returnBook("06"); // book not found

   lib.displayInfo();


}