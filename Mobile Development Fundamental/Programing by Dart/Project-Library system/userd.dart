// create Userd class with two attributs and one method
class Userd {
  String id ;
  String name ;

// primary constractor to intilaize the user id and name 
  Userd(this.id , this.name);

// displayInfo method to print the user information
  void displayInfo() {
    print("User info: \nUser id: $id \nUser name: $name");
    print("*************************");
  }
}
