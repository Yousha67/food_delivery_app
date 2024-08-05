import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/database.dart';
import 'package:food_delivery_app/pages/shared_pref.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
import 'details.dart';


class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {

  String? id,wallet;
  int total=0,amount2=0;

  void startTimer(){
    Timer(Duration(seconds: 3),(){
      amount2=total;
setState(() {

});
    });
  }

  gettheSharedPref()async{
    id=await SharedPreferenceHelper().getUserId();
    wallet=await SharedPreferenceHelper().getUserWallet();
    setState(() {

    });
  }

  ontheload()async{
await gettheSharedPref();
foodStream=await DatabaseMethods().getFoodCart(id!);

setState(() {

});

  }
  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }
  Stream? foodStream;

  Widget FoodCart(){

    return StreamBuilder(stream: foodStream, builder:(context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          itemBuilder:(context,index){
            DocumentSnapshot ds = snapshot.data.docs[index];
            total=total+int.parse(ds["Total"]);
            return Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0),
              child: Material(
                elevation: 6.0,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: Row(

                    children: [
                      Container(

                        margin: EdgeInsets.only(left: 20.0,right: 20.0),
                        height: 100,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Center(child: Text(ds["Quantity"])),
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.network(ds["Image"],height: 120.0,width: 120.0,),
                      ),
                      SizedBox(width: 10.0,),
                      Column(children: [
                        Text(ds["Name"],style: AppWidget.semiboldtextfiledstyle(),),
                        Text("Pkr"+ds["Total"],style: AppWidget.semiboldtextfiledstyle(),),
                      ],)
                    ],
                  ),
                ),
              ),
            );

          }):CircularProgressIndicator();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 3,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child:Center(child: Text("Food Cart",style: AppWidget.Headingfiledstyle(),)),

              ),
            ),
           SizedBox(height: 20.0,),
           Expanded(
             child: Container(
               height: MediaQuery.of(context).size.height/2,
               child: FoodCart(),
             ),
           ),

           /* Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Material(
                elevation: 6.0,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: Row(

                    children: [
                      Container(

                        margin: EdgeInsets.only(left: 20.0,right: 20.0),
                        height: 100,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Center(child: Text("2")),
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.asset("images/salad3.png",height: 120.0,width: 120.0,),
                      ),
                      SizedBox(width: 10.0,),
                      Column(children: [
                        Text("Salad",style: AppWidget.semiboldtextfiledstyle(),),
                        Text("Pkr40",style: AppWidget.semiboldtextfiledstyle(),),
                      ],)
                    ],
                  ),
                ),
              ),
            ),*/
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0,left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price",style: AppWidget.Headingfiledstyle(),),
                  Text("Pkr"+total.toString(),style: AppWidget.boldtextfiledstyle(),)
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: ()async{
                int amount= int.parse(wallet!)-amount2;
                await DatabaseMethods().UpdateUserWallet(id!, amount.toString());
                await SharedPreferenceHelper().saveUserWallet(amount.toString());

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      "Amount has been deducted from your wallet",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                padding: EdgeInsets.symmetric(vertical: 14.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: Center(child: Text("CheckOut",style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.white),)),

              ),
            )
          ],
        ),
      ),
    );
  }
}
