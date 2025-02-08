import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jewelry_shopping_app/login.dart';
import 'package:jewelry_shopping_app/widgets/custom_textfield.dart';
import 'package:jewelry_shopping_app/widgets/flutter_toast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passToggle = true;
  bool confirmpassToggle = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Form(
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
                        Align(
                          alignment: IsArabic()
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Text(
                            tr("SignUp.SignUp"),
                            style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 109, 11, 112)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          controller: nameController,
                          labelText: tr("SignUp.FullName"),
                          prefixIcon: const Icon(Icons.person),
                          isPasswordField: false,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return tr("SignUp.EmptyNameError");
                            } else if (value != null &&
                                value[0] != value[0].toUpperCase()) {
                              return tr("SignUp.NameError");
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: phoneController,
                          labelText: tr("SignUp.Phone"),
                          prefixIcon: const Icon(Icons.phone),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return tr("SignUp.EmptyPhoneError");
                            } else if (value != null && value.length < 11) {
                              return tr("SignUp.PhoneError");
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          labelText: tr("SignUp.Email"),
                          prefixIcon: const Icon(Icons.alternate_email),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return tr("SignUp.EmptyEmailError");
                            } else if (value != null &&
                                !value.contains('@') &&
                                !value.contains('.com')) {
                              return tr("SignUp.EmailError");
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          labelText: tr("SignUp.Password"),
                          prefixIcon: const Icon(Icons.lock_open),
                          isPasswordField: true,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return tr("SignUp.EmptyPasswordError");
                            } else if (value.length < 6) {
                              return tr("SignUp.PasswordError");
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.text,
                          labelText: tr("SignUp.ConfirmPassword"),
                          prefixIcon: const Icon(Icons.lock_open),
                          isPasswordField: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return tr("SignUp.EmptyConfirmPasswordError");
                            } else if (value != passwordController.text) {
                              return tr("SignUp.ConfirmPasswordError");
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                   if (credential.user != null) {
                                    showToast(tr("SignUp.userAddedSuccessfully"), Colors.lightGreen);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>Login()));
                                  }
                                  else {
                                     showToast(tr("SignUp.loginError"), Colors.redAccent);
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    showToast(tr("SignUp.weakPassword"), Colors.redAccent);
                                    
                                  } else if (e.code == 'email-already-in-use') {
                                     showToast(tr("SignUp.accountAlreadyRegisterd"), Colors.redAccent);
                                  }
                                  
                                  // else {
                                  //    showToast( e.message ?? tr("SignUp.loginError") , Colors.redAccent);
                                  // }
                                } catch (e) {
                                  // showToast( e.toString()  , Colors.redAccent);
                                }
                              }
                            },
                            child: Center(
                              child: Container(
                                height: 40,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Color(0xffd0aad1),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(30)),
                                child:  Center(
                                        child: Text(
                                          tr("SignUp.signUpButton"),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 109, 11, 112),
                                              fontSize: 20),
                                        ),
                                      )
                                   
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => Login()));
                          },
                          child: Center(
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text: tr("SignUp.alreadyHaveAnAccount"),
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                ),
                                TextSpan(
                                    text: tr("SignUp.goToLoginPage"),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 109, 11, 112),
                                        fontSize: 14)),
                              ]),
                            ),
                          ),
                        ),
                      ]))))),
    ));
  }

  bool IsArabic() {
    return context.locale.languageCode == "ar";
  }
}
