import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/database.dart';
import 'package:food_delivery_app/pages/details.dart';
import 'package:food_delivery_app/pages/loginpage.dart';
import 'package:food_delivery_app/pages/widget_support.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false ,Salad = false, burger = false;
Stream? fooditemstream;



ontheload()async{
  fooditemstream = await DatabaseMethods().getFoodItem("Salad");
  setState(() {

  });
}
@override
  void initState() {
  ontheload();
    // TODO: implement initState
    super.initState();
  }

  Widget allItems(){

  return StreamBuilder(stream: fooditemstream, builder:(context, AsyncSnapshot snapshot){
    return snapshot.hasData? ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: snapshot.data.docs.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,

        itemBuilder:(context,index){
        DocumentSnapshot ds = snapshot.data.docs[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(detail: ds["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],),));
          },
          child: Container(

            margin: EdgeInsets.all(4.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(15),
              child: Container(

                padding: EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(ds["Image"],height: 150.0,width: 150.0,fit: BoxFit.cover,)),
                    Text(ds["Name"],style: AppWidget.semiboldtextfiledstyle(),),
                    SizedBox(height: 20,),
                    Text('Fresh and Healthy',style: AppWidget.lightfontfiledstyle(),),
                    SizedBox(height: 20,),
                    Text("pkr"+ds["Price"],style: AppWidget.semiboldtextfiledstyle(),)
                  ],
                ),
              ),
            ),
          ),
        );



    }):CircularProgressIndicator();
  });
  }
  Widget allItemsvertically(){

    return StreamBuilder(stream: fooditemstream, builder:(context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          itemBuilder:(context,index){
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(detail: ds["Detail"],name: ds["Name"],price: ds["Price"],image: ds["Image"],),));
              },
              child:Container(
                padding: EdgeInsets.all( 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(ds["Image"],height: 120,width: 120,fit: BoxFit.cover,)),
                    SizedBox(width: 20,),
                    Column(children: [
                      Container(
                          width: MediaQuery.sizeOf(context).width/2,
                          child: Text(ds["Name"],style: AppWidget.boldtextfiledstyle(),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                          width: MediaQuery.sizeOf(context).width/2,
                          child: Text('Honey Good Chesee',style: AppWidget.lightfontfiledstyle(),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                          width: MediaQuery.sizeOf(context).width/2,
                          child: Text("pkr"+ds["Price"],style: AppWidget.semiboldtextfiledstyle(),)
                      ),

                    ],
                    ),
                  ],

                ),

              ),
            );



          }):CircularProgressIndicator();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0,left: 20.0,),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello Yousha',style: AppWidget.boldtextfiledstyle(),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                  ),

                ],
              ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' Delecious Food ',style: AppWidget.Headingfiledstyle()),

            ],
          ),
              Text(' Discover and Get Great Food ',style: AppWidget.lightfontfiledstyle()),
            SizedBox(height: 20.0,),
              ShowItem(),
              SizedBox(height: 20.0,),
             Container(
                 height: 320,
                 child: allItems()),
          /* SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(),));
                      },
                      child: Container(

                        margin: EdgeInsets.all(4.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(

                            padding: EdgeInsets.all(20),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Image.asset('images/salad1.png',height: 150.0,width: 150.0,fit: BoxFit.cover,),
                                Text('The besutiful Salaad',style: AppWidget.semiboldtextfiledstyle(),),
                                SizedBox(height: 20,),
                                Text('Fresh and Healthy',style: AppWidget.lightfontfiledstyle(),),
                                SizedBox(height: 20,),
                                Text('pkr 150',style: AppWidget.semiboldtextfiledstyle(),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                      SizedBox(width: 20,),

                    Container(
                      margin: EdgeInsets.all(4.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(

                          padding: EdgeInsets.all(20),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Image.asset('images/salad2.png',height: 150.0,width: 150.0,fit: BoxFit.cover,),
                              Text('The besutiful Salaad',style: AppWidget.semiboldtextfiledstyle(),),
                              SizedBox(height: 20,),
                              Text('Fresh and Healthy',style: AppWidget.lightfontfiledstyle(),),
                              SizedBox(height: 20,),
                              Text('pkr 150',style: AppWidget.semiboldtextfiledstyle(),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0,),


                    Container(
                      margin: EdgeInsets.all(4.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(

                          padding: EdgeInsets.all(20),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Image.asset('images/salad3.png',height: 150.0,width: 150.0,fit: BoxFit.cover,),
                              Text('The besutiful Salaad',style: AppWidget.semiboldtextfiledstyle(),),
                              SizedBox(height: 20,),
                              Text('Fresh and Healthy',style: AppWidget.lightfontfiledstyle(),),
                              SizedBox(height: 20,),
                              Text('pkr 150',style: AppWidget.semiboldtextfiledstyle(),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
        
          SizedBox(height: 20,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                child: allItemsvertically(),
                /*Container(
                  padding: EdgeInsets.all( 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/pizzaslice.png',height: 120,width: 120,fit: BoxFit.cover,),
                    SizedBox(width: 20,),
                    Column(children: [
                      Container(
                          width: MediaQuery.sizeOf(context).width/2,
                          child: Text('Mediterium chip Salad',style: AppWidget.boldtextfiledstyle(),)
                      ),
                          SizedBox(height: 10,),
                      Container(
                          width: MediaQuery.sizeOf(context).width/2,
                          child: Text('Honey Good Chesee',style: AppWidget.lightfontfiledstyle(),)
                      ),
                      SizedBox(height: 10,),
                      Container(
                          width: MediaQuery.sizeOf(context).width/2,
                          child: Text('pkr 350',style: AppWidget.semiboldtextfiledstyle(),)
                      ),

                    ],
                    ),
                  ],

                  ),

                ),*/
              ),

        
            ],
          ),

        ),

      ),
    );

  }
  Widget ShowItem(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: ()async{
            icecream=true;
            pizza=false;
            Salad=false;
            burger=false;
            fooditemstream= await DatabaseMethods().getFoodItem("Ice-cream");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,

            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('images/icecream.png',
                height: 40.0,width: 40.0,fit: BoxFit.cover,color: icecream?Colors.white:Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async{
            icecream=false;
            pizza=true;
            Salad=false;
            burger=false;
            fooditemstream=await DatabaseMethods().getFoodItem("Pizza");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,

            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('images/pizza.png',
                height: 40.0,width: 40.0,fit: BoxFit.cover,color: pizza?Colors.white:Colors.black,),
            ),
          ),
        ),

        GestureDetector(
          onTap: ()async{
            icecream=false;
            pizza=false;
            Salad=false;
            burger=true;
            fooditemstream=await DatabaseMethods().getFoodItem("Burge");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,

            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('images/burger.png',
                height: 40.0,width: 40.0,fit: BoxFit.cover,color: burger?Colors.white:Colors.black,),
            ),
          ),
        ),

        GestureDetector(
          onTap: ()async{
            icecream=false;
            pizza=false;
            Salad=true;
            burger=false;
            fooditemstream= await DatabaseMethods().getFoodItem("Salad");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,

            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: Salad?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('images/Salad.png',
                height: 40.0,width: 40.0,fit: BoxFit.cover,color: Salad?Colors.white:Colors.black,),
            ),
          ),
        ),

      ],

    );

  }
}
