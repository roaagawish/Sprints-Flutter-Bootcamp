import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // images for new arrival catergory
  List nrImages = [
    "assets/er1.jpg",
    "assets/er2.jpg",
    "assets/er5.jpg",
    "assets/ne1.jpg",
    "assets/r2.jpg",
    "assets/b1.jpg"
  ];
  // items name
  List productTitle = [
    "Earrings",
    "Earrings",
    "Earrings",
    "Neckless",
    "Ring",
    "Braclet"
  ];
  // items prices
  List price = ["120", "100", "80", "210", "150", "200"];
  // images for hot offers category
  List offerImages = [
    "assets/er3.jpg",
    "assets/b2nr.jpg",
    "assets/ne2.jpg",
    "assets/ne5.jpg",
    "assets/r1.jpg",
    "assets/ne4.jpg"
  ];
  // offers prices
  List offerPrice = ["30", "40", "80", "50", "90", "70"];

  @override
  Widget build(BuildContext context) {
    // using media query for responssive ui
    double highte = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        // add title and some styles
        title: Text(
          "Shopping App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 , color: Color.fromARGB(255, 109, 11, 112)),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black54,
        actions: [
          IconButton(onPressed: () {

            Navigator.pop(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(seconds: 1),
                  child : HomePage()),
            );
          }, icon:Icon(Icons.logout , color: Color.fromARGB(255, 109, 11, 112) ,))
        ],
      ),
      body:
          // make the screen scrollable
          SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              // our products
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Proudects",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 109, 11, 112)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: highte * 0.3,
                width: width,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset("assets/all1.jpg", fit: BoxFit.contain),
                    Image.asset("assets/all2.jpg", fit: BoxFit.contain),
                    Image.asset("assets/all3.jpg", fit: BoxFit.contain),
                    Image.asset("assets/all4.jpg", fit: BoxFit.contain),
                    Image.asset("assets/all5.jpg", fit: BoxFit.contain),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // new arrivals
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New Arrivals",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color:Color.fromARGB(255, 109, 11, 112)),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Column(
                  children: [
                    // GridView
                    SizedBox(
                      height: highte * 0.3,
                      child: GridView.builder(
                          itemCount: nrImages.length,
                          shrinkWrap: true,
                          //physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        nrImages[index],
                                        fit: BoxFit.fill,
                                        height: highte * 0.2,
                                      ),
                                    ),
                                    Text(
                                      productTitle[index],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${price[index]} \$ ",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            SnackBar snackBar = SnackBar(
                                              content: Text(
                                                  "Item added to The cart"),
                                              action: SnackBarAction(
                                                  label: "Ok",
                                                  onPressed: () {}),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                          icon: Icon(Icons.shopping_cart),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // hot offers
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hot Offers",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color:Color.fromARGB(255, 109, 11, 112)),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //list view
              SizedBox(
                height: highte * 0.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: offerImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width * 0.3,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Expanded(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(offerImages[index],
                                      fit: BoxFit.cover))),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${offerPrice[index]} \$ "),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
