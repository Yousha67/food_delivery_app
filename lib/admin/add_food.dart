import 'dart:ffi';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/database.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  final ImagePicker _picker=ImagePicker();
  File? SelectedImage;

  Future getImage()async{
    var image = await _picker.pickImage(source: ImageSource.gallery);

    SelectedImage = File(image!.path);
    setState(() {

    });
  }

  uploadItem()async{
    if(SelectedImage!=null&&namecontroller!=""&&pricecontroller!=""&&detailcontroller!="");
    String addId= randomAlphaNumeric(10);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child("addId");
    final UploadTask task= firebaseStorageRef.putFile(SelectedImage!);
    var downloadUrl= await (await task).ref.getDownloadURL();

    Map<String,dynamic>addItem={
      "Image":downloadUrl,
      "Name":namecontroller.text,
      "Price":pricecontroller.text,
      "Detail":detailcontroller.text
    };
    await DatabaseMethods().addFoodItem(addItem, value!).then((value){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text("Food Item has been added Successfully",
        style: TextStyle(fontSize: 18.0),),
      ));
    });

  }

  final List<String>items=['Ice-cream','Pizza','Salad','Burger'];
  String? value;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Color(0xFF373866),)),
        centerTitle: true,
        title: Text("Add Item",style: AppWidget.Headingfiledstyle(),),

      ),
      body: Container(
        margin: (EdgeInsets.only(top: 30.0,right: 20.0,left: 20.0,bottom: 50.0)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture",style: AppWidget.semiboldtextfiledstyle(),),
             SizedBox(height: 15.0,),
             SelectedImage ==null? GestureDetector(
               onTap: (){
                 getImage();
               },
               child: Center(
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2.5),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                    ),
                  ),
                ),
             ):Center(
               child: Material(
                 elevation: 3.0,
                 borderRadius: BorderRadius.circular(20.0),
                 child: Container(
                   height: 150.0,
                   width: 150.0,
                   decoration: BoxDecoration(
                       border: Border.all(color: Colors.black,width: 2.5),
                       borderRadius: BorderRadius.circular(20.0)
                   ),
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(20.0),
                     child: Image.file(
                       SelectedImage!,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
               ),
             ),


              SizedBox(height: 30.0,),

              Text("Item Name",style: AppWidget.semiboldtextfiledstyle(),),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Item Name",
                  hintStyle: AppWidget.lightfontfiledstyle()
                ),),
              ),



              SizedBox(height: 30.0,),

              Text("Item Price",style: AppWidget.semiboldtextfiledstyle(),),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: pricecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Price",
                      hintStyle: AppWidget.lightfontfiledstyle()
                  ),),
              ),


              SizedBox(height: 30.0,),


              Text("Item Detail",style: AppWidget.semiboldtextfiledstyle(),),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailcontroller,
                  decoration: InputDecoration(

                      border: InputBorder.none,
                      hintText: "Enter Item Detail",
                      hintStyle: AppWidget.lightfontfiledstyle()
                  ),),
              ),

              SizedBox(height: 30.0,),

              Text("Select Category",style: AppWidget.semiboldtextfiledstyle(),),

              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFececf8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(items:
                  items.map((item)=>DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,style: TextStyle(fontSize: 18.0,color: Colors.black),))).toList(),
                    onChanged: ((value)=>setState(() {
                      this.value=value;
                    }
                    )),
                    dropdownColor: Colors.white,hint: Text("Select Category"),iconSize: 36,icon: Icon(Icons.arrow_drop_down,color: Colors.black,),value: value,),
                ),
              ),
              SizedBox(height: 30.0,),

              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius:BorderRadius.circular(10.0),
                    child: Container(
                      width: 150.0,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(child: Text("Add",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
