import 'package:flutter/material.dart';
import 'package:shopping_app_with_animation/home.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passToggle = true;
  bool confirmpassToggle = true;
  bool animate = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
            key: _formKey,
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          SizedBox(height: 40),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 109, 11, 112)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Full Name",
                              prefixIcon: const Icon(Icons.person),
                            ),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Name must not be empty";
                              } else if (value != null &&
                                  value[0] != value[0].toUpperCase()) {
                                return "First letter must be capitalized";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Phone Number",
                              prefixIcon: const Icon(Icons.phone),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Phone Number must not be empty";
                              } else if (value != null && value.length < 11) {
                                return " Phone Number must be 11 digit";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Email Address",
                              prefixIcon: const Icon(Icons.alternate_email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Email address must not be empty";
                              } else if (value != null &&
                                  !value.contains('@')) {
                                return "Unveiled email address , must contains @ symbol";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "Password",
                                prefixIcon: const Icon(Icons.lock_open),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: passToggle
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off))),
                            obscureText: passToggle,
                            obscuringCharacter: "*",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password must not be empty";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: confirmpassToggle,
                            obscuringCharacter: "*",
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "Confirm Password",
                                prefixIcon: const Icon(Icons.lock_open),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        confirmpassToggle = !confirmpassToggle;
                                      });
                                    },
                                    child: confirmpassToggle
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password must not be empty";
                              } else if (value != passwordController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                animate = false ;
                              }  
                              if (animate == false) {
                                myDialog();
                              }
                            },
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: 40,
                                width: size.width * 0.8 ,
                                decoration: BoxDecoration(
                                    color: Color(0xffd0aad1),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(30)),
                                child: animate ? Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 109, 11, 112),
                                        fontSize: 20),
                                        ),
                                )
                                : Center(
                                  child: CircularProgressIndicator(color: Color.fromARGB(255, 109, 11, 112 ,),
                                                                ),
                                ),
                                                        ),
                            )
                          )
                       ])
                     )
                    )
                  )
                )
            );
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations'),
          content: const SingleChildScrollView(
            child: Text("Account Created Successfully"),
          ),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(seconds: 2),
                    reverseDuration: Duration(seconds: 1),
                    reverseType: PageTransitionType.fade,
                    child : HomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
