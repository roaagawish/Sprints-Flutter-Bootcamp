import 'book.dart';
import 'userd.dart';

// create Library class with two attributes and four methods 
class Library {

  String space = "****************************************************************";

  // define list of type books 
  List <Books> books = [];

// define list of type userd
  List <Userd> users = [];

  // addUser method to add new user to the users list
  void addUser (Userd user ) {
      // check if the user is rlearedy exist
      if ( users.any((element) => element.id == user.id && element.name == user.name) ) {
        print("User is already found");
        print(space);
      } else {
        users.add( user); 
        print("User ${user.name} with id ${user.id} is added and ready to borrowe books.");
        print(space);

      }
  }
  // addBook method to add new book to the books list
  void addBook (Books book ) {
      // check if the id and title matches any of the list items
      if ( books.any((b) => b.id == book.id && b.title == book.title) ) {
        print("Book is already found");
        print(space);
      } else {
        books.add( book); 
        print("Book ${book.title} with id ${book.id} is added and ready to be borrowed.");
        print(space);
      }
  }
// borrowBook method to add borrow a book from the books list
void borrowBook(String bookId, String userId, String userName) {
  try {
    // check if the book is a at the list
    Books book = books.firstWhere((b) => b.id == bookId);
    // check the book status
    if (!book.isBorrowed) {
      book.isBorrowed = true;
      print("Book '${book.title}' with ID $bookId is now borrowed by $userName with ID $userId.");
      print(space);
    } else {
      print("Book '${book.title}' is already borrowed.");
      print(space);
    }
  } catch (e) {
    print("Error! Book with ID $bookId not found.");
    print(space);
  }
}

// returnBook method to returen borrowed book to the books list
void returnBook(String bookId) {
  try {
    // check if the book is a at the list
    Books book = books.firstWhere((b) => b.id == bookId);
   // check the book status
    if (book.isBorrowed) {
      // Return the book
      book.isBorrowed = false;
      print("Book '${book.title}' with ID $bookId is returned successfully.");
      print(space);
    } else {
      print("Error! Book '${book.title}' is already in the library.");
      print(space);
    }
  } catch (e) {
    print("Error! Book with ID $bookId not found.");
    print(space);
  }
}


  void displayInfo () {
    print("welcom to our library: ");
    print("we have list of books you can choose btween them :" );
    for (var book in books) { book.displayInfo();}
    print("you can also be member at our library and join our users :");
    for (var user in users) { user.displayInfo();}
  }

}