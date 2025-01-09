import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localization_in_shopping_app/sign_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // images for new arrival catergory
  List nrImages = [
    "assets/img/er1.jpg",
    "assets/img/er2.jpg",
    "assets/img/er5.jpg",
    "assets/img/ne1.jpg",
    "assets/img/r2.jpg",
    "assets/img/b1.jpg"
  ];

  // items prices
  List price = ["120", "100", "80", "210", "150", "200"];
  // images for hot offers category
  List offerImages = [
    "assets/img/er3.jpg",
    "assets/img/b2nr.jpg",
    "assets/img/ne2.jpg",
    "assets/img/ne5.jpg",
    "assets/img/r1.jpg",
    "assets/img/ne4.jpg"
  ];
  // offers prices
  List offerPrice = ["30", "40", "80", "50", "90", "70"];

  @override
  Widget build(BuildContext context) {
    // items name
    List productTitle = [
      tr("Product.Earrings"),
      tr("Product.Earrings"),
      tr("Product.Earrings"),
      tr("Product.Neckless"),
      tr("Product.Ring"),
      tr("Product.Braclet"),
      //"Earrings" , "Earrings" , "Earrings" , "Neckless" , "Ring" , "Braclet"
    ];
    // using media query for responssive ui
    double highte = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        // add title and some styles
        title: Text(
          tr("AppBarTitle"),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 109, 11, 112)),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black54,
        actions: [
          Icon(
            Icons.translate,
            color: Color.fromARGB(255, 109, 11, 112),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: SizedBox(
              height: 40,
            )),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(tr("Drawer.Notifications")),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.translate),
              title: Text(tr("Drawer.Languages")),
              onTap: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(tr("Drawer.ChooseLang")),
                        actions: [
                          TextButton(
                            child: Text(tr("Drawer.English")),
                            onPressed: () {
                              setState(() {
                                context.setLocale(Locale('en', 'US'));
                              });
                            },
                          ),
                          TextButton(
                            child: Text(tr("Drawer.Arabic")),
                            onPressed: () {
                              setState(() {
                                context.setLocale(Locale('ar', 'EG'));
                              });
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(tr("Drawer.Setting")),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(tr("Drawer.About")),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(tr("Drawer.Logout")),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
          ],
        ),
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
                alignment:
                    IsArabic() ? Alignment.bottomRight : Alignment.centerLeft,
                child: Text(
                  tr("OurProudects"),
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
                    Image.asset("assets/img/all1.jpg", fit: BoxFit.contain),
                    Image.asset("assets/img/all2.jpg", fit: BoxFit.contain),
                    Image.asset("assets/img/all3.jpg", fit: BoxFit.contain),
                    Image.asset("assets/img/all4.jpg", fit: BoxFit.contain),
                    Image.asset("assets/img/all5.jpg", fit: BoxFit.contain),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // new arrivals
              Align(
                alignment:
                    IsArabic() ? Alignment.bottomRight : Alignment.centerLeft,
                child: Text(
                  tr("NewArrivals"),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 109, 11, 112)),
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
                                              content: Text(tr("SnackBar")),
                                              action: SnackBarAction(
                                                  label: tr("SnackBarAction"),
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
                alignment:
                    IsArabic() ? Alignment.bottomRight : Alignment.centerLeft,
                child: Text(
                  tr("HotOffers"),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 109, 11, 112)),
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

  bool IsArabic() {
    return context.locale.languageCode == "ar";
  }
}
