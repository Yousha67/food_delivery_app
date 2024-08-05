import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/loginpage.dart';
import 'package:food_delivery_app/pages/shared_pref.dart';
import 'package:food_delivery_app/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String? name,profile,email;

  final ImagePicker _picker=ImagePicker();
  File? SelectedImage;

  Future getImage()async{
    var image = await _picker.pickImage(source: ImageSource.gallery);

    SelectedImage = File(image!.path);
    setState(() {
uploadItem();
    });
  }

  uploadItem()async{
    if(SelectedImage!=null) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
          "blogImages").child("addId");
      final UploadTask task = firebaseStorageRef.putFile(SelectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();
      await SharedPreferenceHelper().saveUserProfile(downloadUrl);
      setState(() {

      });
    }

  }

  getthesharedpref()async{
    profile=await SharedPreferenceHelper().getUserProfile();
    name=await SharedPreferenceHelper().getUserName();
    email=await SharedPreferenceHelper().getUserEmail();
    setState(() {

    });

  }

  onthisload()async{
    await getthesharedpref();
    setState(() {

    });
  }
@override
  void initState() {
 onthisload();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: name==null?CircularProgressIndicator(): SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/4.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105.5)
                      )
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/6),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(70.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70.0),
                          child:SelectedImage==null? GestureDetector(
                            onTap: (){
                              getImage();
                            },
                              child:profile==null?Image.asset("images/salad1.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ) :Image.network(profile!,
                                height: 150,width: 150,
                                fit: BoxFit.cover,)
                          ):Image.file(SelectedImage!),
                        ),
                      ),
        
                    ),
                  ),
        
                  Padding(padding: EdgeInsets.only(top: 70.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name!,style: TextStyle(
                          color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: "Poppins"
        
                        ),)
                      ],
                    ) ,
        
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 3.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        Icon(Icons.person,color: Colors.black,),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
        
                          Text("Name",style:TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold) ,),
                          Text(name!,style:TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold) ,)
                        ],)
                      ],
                    ),
        
                  ),
                ),
              ),
        
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 3.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        Icon(Icons.email,color: Colors.black,),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
        
                            Text("Emil",style:TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold) ,),
                            Text(email!,style:TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold) ,)
                          ],)
                      ],
                    ),
        
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 3.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        Icon(Icons.description,color: Colors.black,),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
        
                            Text("Terms and Condition",style:TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold) ,),
        
                          ],)
                      ],
                    ),
        
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){
                  AuthMethods().DeleteUser();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 3.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        children: [
                          Icon(Icons.delete,color: Colors.black,),
                          SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
        
                              Text("Delete Account",style:TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold) ,),
        
                            ],)
                        ],
                      ),
        
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){
                  AuthMethods().SignOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Loginpage()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 3.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        children: [
                          Icon(Icons.logout,color: Colors.black,),
                          SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
        
                              Text("LogOut",style:TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold) ,),
        
                            ],)
                        ],
                      ),
        
                    ),
                  ),
                ),
              )
        
            ],
          ),
        ),
      ) ,
    );
  }
}
