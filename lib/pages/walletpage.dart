import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app/pages/app_content.dart';
import 'package:food_delivery_app/pages/shared_pref.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
import 'package:http/http.dart'as http;

import 'database.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet,Id;
  int?add;
  TextEditingController amountcontroller = TextEditingController();
  SharedPreferenceHelper sharedPreferenceHelper=SharedPreferenceHelper();
  DatabaseMethods databaseMethods = DatabaseMethods();
  getthesharedpref()async{
    wallet=await sharedPreferenceHelper.getUserWallet();
    Id=await sharedPreferenceHelper.getUserId();
    setState(() {

    });
  }

  ontheload()async{
  await getthesharedpref();
  setState(() {

  });

  }

  @override
  void initState() {
    // TODO: implement initState
    ontheload();
    super.initState();
  }

  Map<String,dynamic>?paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet==null? CircularProgressIndicator() :Container(
        margin: EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(children: [
            Material(
             elevation: 3,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
               child:Center(child: Text("Wallet",style: AppWidget.Headingfiledstyle(),)),
          
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(children: [
                Image.asset("images/wallet.png",height: 70,width: 70,fit:BoxFit.cover),
                SizedBox(width: 40,),
                Column(
          
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Your Wallet",style: AppWidget.lightfontfiledstyle(),),
                    SizedBox(height: 8.0,),
                    Text("\$"+ wallet!,
                      style: AppWidget.boldtextfiledstyle(),)
                ],),
          
              ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
          
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Add Money",style: AppWidget.boldtextfiledstyle(),),
                ),
              ],
            ),
            SizedBox(height: 7.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              GestureDetector(
                onTap: (){
                  makePayment('100');
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text("\$"+"100",style: AppWidget.semiboldtextfiledstyle(),),
                ),
              ),
              GestureDetector(
                onTap: (){
                  makePayment('500');
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE9E2E2)),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text("\$"+"500",style: AppWidget.semiboldtextfiledstyle(),),
                ),
              ),
              GestureDetector(
                onTap: (){
                  makePayment('1000');
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE9E2E2)),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text("\$"+"1000",style: AppWidget.semiboldtextfiledstyle(),),
                ),
              ),
              GestureDetector(
                onTap: (){
                  makePayment('2000');
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE9E2E2)),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text("\$"+"2000",style: AppWidget.semiboldtextfiledstyle(),),
                ),
              ),
          
            ],),
            SizedBox(height: 45,),
            GestureDetector(
              onTap: (){
                openEdit();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.teal,
          
                ),
                child: Center(
                  child: Text("Add Money",style:
                  TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
                ),
              ),
            )
          
          ],),
        ),

      ),
    );
  }
  Future<void>makePayment(String amount)async{
    try{
      paymentIntent=await createPaymentIntent(amount,'USD');
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:paymentIntent!['client_secret'],
        style: ThemeMode.dark,
        merchantDisplayName: 'Yousha',
      )).then((value){});
      displayPaymentSheet(amount);


    }catch(e,s){
      print('exception:$e$s');
    }
  }
  displayPaymentSheet(String amount)async{
    try{
      await Stripe.instance.presentPaymentSheet().then((value)async{
        add= int.parse(wallet!)+int.parse(amount);
        await sharedPreferenceHelper.saveUserWallet(add.toString());
        await databaseMethods.UpdateUserWallet(Id!, add.toString());
        showDialog(context:context,builder:(_)=>AlertDialog(
          content: Column(children: [
            Row(children: [
              Icon(Icons.check_circle,color: Color(0xFF00563F),),
              Text("Payment Successful")
            ],)

          ],),
        ));
        await getthesharedpref();
       // await usergetprofile();
        paymentIntent=null;
      }
      ).onError((error,StackTrace){

        print('Error is :----->$error$StackTrace');
      }) ;
    }on StripeException catch(e){
      print('Error is :--->$e');
      showDialog(context: context,builder: (_)=>const AlertDialog(
        content: Text('Cancelled'),
      ));

    }catch(e){
      print('$e');
    }

  }
  createPaymentIntent(String amount,String currency)async{
    try{
      Map<String,dynamic>body={
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]':'card',
      };
      var response=await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':'Bearer $secretkey',
          'Content-Type':'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print('Payment Intent Body ->>${response.body.toString()}');
      return jsonDecode(response.body);
    }catch(err){
      print('err changing user :${err.toString()}');
    }
  }
  calculateAmount(String amount){
    final calculatedAmount= int.parse(amount)*100;
    return calculatedAmount.toString();
  }

  Future openEdit()=>showDialog(context: context, builder: (context)=>AlertDialog(

    content: SingleChildScrollView(

      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel),
              ),

              Center(
                child: Text('Add Money ',style:
                  TextStyle(color: Color(0xFF008080),fontWeight: FontWeight.bold,fontSize: 15.0),),
              )

            ],),

            SizedBox(height: 15.0,),

            Text("Amount",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38,width: 3.0,),
                borderRadius: BorderRadius.circular(10.0),

              ),
              child: TextField(
                controller: amountcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Amount",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20.0,),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  makePayment(amountcontroller.text);
                },
                child: Container(
                  width: 100,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF008080),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Center(child: Text('Pay',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),

    ),

  ));




}
