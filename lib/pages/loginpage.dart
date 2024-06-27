
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/sign_up.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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

                        child: Column(


                          children: [

                            SizedBox(height: 20,),
                          Text('Login',style: AppWidget.Headingfiledstyle(),),
                            SizedBox(height: 20,),
                            TextField(

                              decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined),
                                hintStyle: AppWidget.semiboldtextfiledstyle()
                              ),
                            ),
                            SizedBox(height: 10,),

                            TextField(
                              obscureText: true,

                              decoration: InputDecoration(

                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.password_outlined),
                                  hintStyle: AppWidget.semiboldtextfiledstyle()
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                                alignment: Alignment.topRight,
                                child: Text('Forget Password?',style: AppWidget.semiboldtextfiledstyle(),),
                            ),
                            SizedBox(height: 70,),
                            Material(
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




                        ],

                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()));
                      },
                      child: Text("don't have an account? Sign up" ,
                        style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                  ],
                ),
                           ),






        ],
      ),
      )
    );
  }
}
