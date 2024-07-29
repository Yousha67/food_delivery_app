import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/widget_support.dart';

import 'add_food.dart';
class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Center(
              child: Text("Home Admin",style: AppWidget.Headingfiledstyle(),),
            ),
            SizedBox(height: 30.0,),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddFood()));
              },
              child: Material(
                elevation: 4.0,
                child: Container(
                  margin: EdgeInsets.only(right: 15.0,left: 15.0),
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset("images/food.png",height: 100,width: 100,fit: BoxFit.contain,),
                    ),SizedBox(width: 30.0,),
                    Text("Add Food Items",style:TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white
                    ),),
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
