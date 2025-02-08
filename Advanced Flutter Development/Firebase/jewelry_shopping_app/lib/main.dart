import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jewelry_shopping_app/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/lang', // path of the translation files
      fallbackLocale: Locale('ar', 'EG'),
      child: MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: tr("AppTitle"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffd0aad1)),
        useMaterial3: true,
      ),
      home: SignUp(),
    );
  }
}