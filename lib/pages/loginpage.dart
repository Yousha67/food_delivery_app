
import 'package:flutter/material.dart';
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))


            ),
            child: Text(''),
          ),
          Material(

            child: Container(
              margin: EdgeInsets.only(left: 110,right: 80),
              child: Column(

                children: [
                  Image.asset('images/logo.png',width: MediaQuery.sizeOf(context).width/2.5,fit: BoxFit.cover,),
                  Container(
                  //  width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(children: [
                      Text('Login',style: AppWidget.semiboldtextfiledstyle(),)

                    ],

                    ),
                  ),
                ],
              ),
            ),
          )




        ],
      ),
      )
    );
  }
}
