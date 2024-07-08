import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/database.dart';
import 'package:food_delivery_app/pages/loginpage.dart';
import 'package:food_delivery_app/pages/shared_pref.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
import 'package:random_string/random_string.dart';
import 'bottomnav.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email="",name="",password="";
  TextEditingController namecontroller= TextEditingController();
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();

  final _formkey= GlobalKey<FormState>();
  DatabaseMethods databaseMethods = DatabaseMethods();
  SharedPreferenceHelper sharedPreferenceHelper=SharedPreferenceHelper();
  registration()async{
    if(_formkey.currentState!.validate()){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Registrated Successfully",style: TextStyle(fontSize: 20.0),),)));

        String Id=randomAlphaNumeric(15);
        Map<String,dynamic>addUserInfo={
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "Wallet": "0",
          "Id":Id,
        };
        await databaseMethods.addUserDetail(addUserInfo,Id);
        await sharedPreferenceHelper.saveUserName(namecontroller.text);
        await sharedPreferenceHelper.saveUserEmail(emailcontroller.text);
        await sharedPreferenceHelper.saveUserWallet('0');
        await sharedPreferenceHelper.saveUserId(Id);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav(),));

      }on FirebaseException catch(e){
        if(e.code=='weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text("Password Provided is too weak",style: TextStyle(fontSize: 18.0),)));


        }else if(e.code=='email-already-in-use'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text("Account Already exists",style: TextStyle(fontSize: 18.0),)));
        }
      }
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
                        height: MediaQuery.sizeOf(context).height/1.8,
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
                                Text('Sign up',style: AppWidget.Headingfiledstyle(),),
                                SizedBox(height: 20,),
                                TextFormField(
                                  controller: namecontroller,
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return "Please Enter Name";
                                    }
                                    return null;
                                          
                                  },
                                          
                                  decoration: InputDecoration(
                                      hintText: 'Name',
                                      prefixIcon: Icon(Icons.person_outline),
                                      hintStyle: AppWidget.semiboldtextfiledstyle()
                                  ),
                                ),
                                SizedBox(height: 20,),
                                TextFormField(
                                  controller: emailcontroller,
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return "Please Enter E-mail";
                                    }
                                    return null;
                                          
                                  },
                                          
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      prefixIcon: Icon(Icons.email_outlined),
                                      hintStyle: AppWidget.semiboldtextfiledstyle()
                                  ),
                                ),
                                SizedBox(height: 20,),
                                          
                                TextFormField(
                                          
                                  controller: passwordcontroller,
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return "Please Enter Password";
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
                                          
                                SizedBox(height: 20,),
                                GestureDetector(
                                  onTap: ()async{
                                    if(_formkey.currentState!.validate()){
                                      setState(() {
                                        email=emailcontroller.text;
                                        name=namecontroller.text;
                                        password=passwordcontroller.text;
                                          
                                      });
                                    }
                                    registration();
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
                                        child: Text('Sign up',style: TextStyle(fontSize: 20,fontFamily: 'Poppins',
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
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Loginpage()));
                      },
                      child: Text("Already have an account? Login" ,
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
