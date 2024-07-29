import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app/admin/admin_login.dart';
import 'package:food_delivery_app/admin/home_admin.dart';
import 'package:food_delivery_app/pages/app_content.dart';
import 'package:food_delivery_app/pages/bottomnav.dart';
import 'package:food_delivery_app/pages/loginpage.dart';
import 'package:food_delivery_app/pages/onboard.dart';
import 'package:food_delivery_app/pages/sign_up.dart';
import 'package:food_delivery_app/pages/forget_pass.dart';


import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=publishablekey;
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:OnBoard(),
    );
  }
}
