
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/forget_pass.dart';
import 'package:food_delivery_app/pages/sign_up.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
import 'package:food_delivery_app/pages/forget_pass.dart';

import 'bottomnav.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email="", password="";
  TextEditingController useremailcontroller=  TextEditingController();
  TextEditingController userpasswordcontroller=  TextEditingController();
  final _formkey=GlobalKey<FormState>();

  userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Have a nice day sir!",style: TextStyle(fontSize: 20.0),),)));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav(),));
    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text("No User found for this E-mail",style:
            TextStyle(fontSize: 18.0,color: Colors.black),)));

      }else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text("Wrong Password ",style:
            TextStyle(fontSize: 18.0,color: Colors.black),)));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "The email address is not valid.",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
    } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Error: ${e.message}",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
      print('Error: ${e.code} - ${e.message}');
    } catch (e) {
      print('Error: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "An unexpected error occurred.",
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height/2.5,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(

              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [

                Color(0xFFff5c30),
                Color(0xFFe74b1a),
                
              ]
              )
            )
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height/3),
            height: MediaQuery.sizeOf(context).height/2,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))


            ),
            child: Text(''),
          ),




                Container(

                margin: EdgeInsets.only(left: 50,right: 50),
                child: SingleChildScrollView(
                  child: Column(
                  
                    children: [
                      Center(child: Image.asset('images/logo.png',width: MediaQuery.sizeOf(context).width/2.5,fit: BoxFit.cover,)),
                  
                  
                      Material(
                        borderRadius: BorderRadius.circular(8),
                        elevation: 6.0,
                        child: Container(
                          padding: EdgeInsets.only(left: 20,right: 20),

                         width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white

                          ),

                          child: SingleChildScrollView(
                            child: Form(
                              key: _formkey,
                              child: Column(
                            
                            
                                children: [
                            
                                  SizedBox(height: 20,),
                                Text('Login',style: AppWidget.Headingfiledstyle(),),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    controller: useremailcontroller,
                                    validator: (value){
                                      if(value==null||value.isEmpty){
                                        return 'Please Enter E-mail';
                                      }
                                      return null;
                                    },
                            
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      prefixIcon: Icon(Icons.email_outlined),
                                      hintStyle: AppWidget.semiboldtextfiledstyle()
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                            
                                  TextFormField(
                                    controller: userpasswordcontroller,
                                    validator: (value){
                                      if(value==null||value.isEmpty){
                                        return 'Please Enter Password';
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                            
                                    decoration: InputDecoration(
                            
                                        hintText: 'Password',
                                        prefixIcon: Icon(Icons.password_outlined),
                                        hintStyle: AppWidget.semiboldtextfiledstyle()
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                                    },
                                    child: Container(
                                        alignment: Alignment.topRight,
                                        child: Text('Forget Password?',style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                        )
                                          ,),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  GestureDetector(
                                    onTap: (){
                                      if(_formkey.currentState!.validate()){
                                        email=useremailcontroller.text;
                                        password=userpasswordcontroller.text;
                                        userLogin();
                                      }
                            
                                    },
                                    child: Material(
                            
                                      borderRadius: BorderRadius.circular(20),
                                      elevation: 6,
                                      child: Container(
                                        width: 150,
                                        padding: EdgeInsets.symmetric(vertical: 7),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color(0xffff5722),),
                                        child: Center(
                                          child: Text('Login',style: TextStyle(fontSize: 20,fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ),
                            
                            
                            
                            
                              ],
                            
                              ),
                            ),
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp(),));
                        },
                        child: Text("don't have an account? Sign up" ,
                          style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                    ],
                  ),
                ),
                           ),






        ],
      ),
      )
    );
  }
}
