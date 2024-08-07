import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/home.dart';
import 'package:food_delivery_app/pages/bottomnav.dart';
import 'package:food_delivery_app/pages/content_model.dart';
import 'package:food_delivery_app/pages/loginpage.dart';
import 'package:food_delivery_app/pages/sign_up.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  var auth=FirebaseAuth.instance;
  var isLogin=false;
  checkIfLogin()async{
    auth.authStateChanges().listen((User? user){
      if(user!=null&&mounted){
        setState(() {
          isLogin=true;
        });
      }
    });
  }


  int currentindex = 0;
  late PageController _controller;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    checkIfLogin();
    _controller=PageController(initialPage: 0);
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    
    return Scaffold(

      body: Column(
        children: [Expanded(
          child: PageView.builder(
          
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index){
                setState(() {
                  currentindex=index;
                });

              },
              itemBuilder: ( _,i ){
          
            return Padding(padding: EdgeInsets.all(20),
          
            child: SingleChildScrollView(

              child: Column(children: [
                Image.asset(contents[i].image,height: 400,
                  width: MediaQuery.sizeOf(context).width/1.5,fit: BoxFit.fill,),
                SizedBox(height: 40,),
                Text(contents[i].title,style: AppWidget.semiboldtextfiledstyle(),),
                SizedBox(height: 20,),
                Text(contents[i].description,style: AppWidget.lightfontfiledstyle(),),



              ],),
            ),
          
            );
          }
          ),
        ),
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index)=>
                buildDot(index,context),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(currentindex==contents.length-1){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=>isLogin? BottomNav():Loginpage(),));
              }
              _controller.nextPage(duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red),
              height: 45,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(child: Text(
                  currentindex==contents.length-1?'Start':
                  'Next',style: TextStyle(fontSize:20,color: Colors.white))),
            ),
          )
          
        ],
      ),
    );
  }
  Container buildDot (int index,BuildContext context){
    return Container(
      height: 10.0,
      width: currentindex==index?18:7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.black38,
      ),
    );

  }
}
