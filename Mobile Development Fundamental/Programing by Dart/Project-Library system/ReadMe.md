# Library Management System

This project is a simple library management system implemented in Dart. It allows adding books and users, borrowing and returning books, and displaying information about the library.

## Features

1. **Books Management**
   - Add new books to the library.
   - Display detailed information about each book.
   - Borrow or return books, updating their status.

2. **User Management**
   - Add new users to the library.
   - Display detailed information about each user.

3. **Library Operations**
   - Manage the list of books and users.
   - Borrow and return books with validation for availability.
   - Display the complete state of the library, including books and users.

---

## File Structure

### `book.dart`
Defines the `Books` class, which contains:
- **Attributes**:
  - `id`: Unique identifier for each book.
  - `title`: The title of the book.
  - `isBorrowed`: Boolean indicating if the book is borrowed.
- **Methods**:
  - `displayInfo()`: Displays the book's details.
  
### `userd.dart`
Defines the `Userd` class, which contains:
- **Attributes**:
  - `id`: Unique identifier for each user.
  - `name`: Name of the user.
- **Methods**:
  - `displayInfo()`: Displays the user's details.

### `library.dart`
Defines the `Library` class, which manages books and users:
- **Attributes**:
  - `books`: A list of books available in the library.
  - `users`: A list of users registered in the library.
- **Methods**:
  - `addUser(Userd user)`: Adds a new user to the library.
  - `addBook(Books book)`: Adds a new book to the library.
  - `borrowBook(String bookId, String userId, String userName)`: Allows a user to borrow a book.
  - `returnBook(String bookId)`: Allows a user to return a book.
  - `displayInfo()`: Displays the current state of the library, including all books and users.

### `main.dart`
The entry point of the application:
- **Operations**:
  - Creates instances of `Books`, `Userd`, and `Library`.
  - Adds books and users to the library.
  - Performs borrowing and returning operations with various scenarios.
  - Displays the final state of the library.

---

## How to Run

1. **Setup**:
   - Ensure Dart is installed on your system.
   - Clone the repository to your local machine.

2. **Execution**:
   - Open a terminal in the project directory.
   - Run the following command:
     ```bash
     dart main.dart
     ```

3. **Output**:
   - View the operations and the library's final state in the terminal.

---

## Example Output

Here is a sample output after running the program:

Book book1 with id 01 is added and ready to be borrowed.
****************************************************************
User roaa with id 8769 is added and ready to borrowe books.
****************************************************************


Book 'book1' with ID 01 is now borrowed by roaa with ID 8769.
****************************************************************
Book 'book2' is already borrowed.
****************************************************************
Error! Book with ID 05 not found.
****************************************************************
Book 'book1' with ID 01 is returned successfully.
****************************************************************
Error! Book 'book3' is already in the library.
****************************************************************
Error! Book with ID 06 not found.
****************************************************************


welcom to our library: 
we have list of books you can choose btween them :
Book info: 
Book id: 01 
Book title: book1 
Book status: not borrowed
*************************
Book info: 
Book id: 02 
Book title: book2 
Book status: borrowed
*************************
Book info: 
Book id: 03 
Book title: book3 
Book status: not borrowed
*************************
Book info: 
Book id: 04 
Book title: book4 
Book status: borrowed
*************************
you can also be member at our library and join our users :
User info: 
User id: 8769 
User name: roaa
*************************
User info: 
User id: 6789 
User name: ayman
*************************
User info: 
User id: 2334 
User name: ali
*************************
User info: 
User id: 5788 
User name: dina
*************************
User info: 
User id: 2092 
User name: rana
*************************