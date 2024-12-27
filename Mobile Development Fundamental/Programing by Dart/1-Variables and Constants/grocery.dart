void main() {

  // list of grocery items with name and price 
  List <Map> grocery = [
    {"name": "milk", "price": 60},
    {"name": "bread", "price": 45},
    {"name": "flour", "price": 21},
    {"name": "eggs", "price": 95.5},
  ];

  const tax = 0.1 ;

  double totalWithoutTax = 0.0;

  // Loop through the list to calculate the total price
  for (var item in grocery ) {
    totalWithoutTax += item["price"];
  }

  // Calculate the total price after adding tax
  double totalWithTax = totalWithoutTax + (totalWithoutTax * tax);

  // Print the results
  print("Total Price Before Tax: \$${totalWithoutTax}");
  print("Total Price After Tax: \$${totalWithTax}");
}
