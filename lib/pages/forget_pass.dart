import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/sign_up.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailedittingcontroller = TextEditingController();
  String email = "";
  final _formkey = GlobalKey<FormState>();
  final usersCollection = FirebaseFirestore.instance.collection("users");

  Future<void> resetPassword() async {
    try {
      // Check if the email exists in the database
      final emailExists = await _checkEmailExists(email);
      if (!emailExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No user found for that email",
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
        return;
      }

      // Send the password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password reset mail has been sent!",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No user found for that email",
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Error: ${e.message}",
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }
    }
  }

  Future<bool> _checkEmailExists(String email) async {
    try {
      final querySnapshot = await usersCollection.where('email', isEqualTo: email.trim()).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking email existence: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(fontSize: 35.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Enter Your E-mail",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Form(
              key: _formkey,
              child: Container(
                padding: EdgeInsets.only(right: 5.0, left: 5.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextFormField(
                  controller: emailedittingcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter E-mail';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                    prefixIcon: Icon(Icons.person, size: 30, color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    email = emailedittingcontroller.text;
                  });
                  resetPassword();
                }
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Send E-mail",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Create",
                    style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
