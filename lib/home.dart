import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/details.dart';
import 'package:food_delivery_app/pages/widget_support.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false ,Salad = false, burger = false;
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
                  )
                ],
              ),
          SizedBox(height: 20.0,),
          Text(' Delecious Food ',style: AppWidget.Headingfiledstyle()),
              Text(' Discover and Get Great Food ',style: AppWidget.lightfontfiledstyle()),
            SizedBox(height: 20.0,),
              ShowItem(),
              SizedBox(height: 20.0,),
              SingleChildScrollView(
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
              ),
        
          SizedBox(height: 20,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
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
        
                ),
              )
        
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
          onTap: (){
            icecream=true;
            pizza=false;
            Salad=false;
            burger=false;
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
          onTap: (){
            icecream=false;
            pizza=true;
            Salad=false;
            burger=false;
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
          onTap: (){
            icecream=false;
            pizza=false;
            Salad=false;
            burger=true;
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
          onTap: (){
            icecream=false;
            pizza=false;
            Salad=true;
            burger=false;
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
