// create Books class contain three attributes and one method
class Books {
  String id ;
  String title ;
  bool isBorrowed ;

// primary constractor to intilaize the book id , title and status if borrowed or not 
  Books(this.id , this.title , this.isBorrowed);
 
 // displayInfo method to print the book information
  void displayInfo() {
    print("Book info: \nBook id: $id \nBook title: $title \nBook status: ${isBorrowed ? "borrowed" : "not borrowed"}");
    print("*************************");
  }
}