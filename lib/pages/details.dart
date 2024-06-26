import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            GestureDetector(

                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)
            ),
            Image.asset('images/burger.png',width: MediaQuery.sizeOf(context).width,height: MediaQuery.sizeOf(context).height/2.5,fit: BoxFit.fill,),

            Row(

              children: [

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Mediterian',style: AppWidget.semiboldtextfiledstyle(),),
                    Text('Chickpes Salad',style: AppWidget.boldtextfiledstyle(),),
                  ],
                ),
                Spacer(),

                GestureDetector(
                  onTap: (){
                    if(a>1){
                    --a;
                    }
                    setState(() {

                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Icon(Icons.remove,color: Colors.white,)),
                ),
                SizedBox(width: 20,),

                Text(a.toString(),style: AppWidget.boldtextfiledstyle(),),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    ++a;
                    setState(() {

                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Icon(Icons.add,color: Colors.white,)),
                ),
              ],
            ),
            Text("The Mediterium Chip Salad is a refreshing and healthy dish, featuring fresh Romaine lettuce, cherry tomatoes, cucumbers, red onions, Kalamata olives, feta cheese, and crispy tortilla chips, all tossed in a zesty Mediterranean dressing. It's rich in vitamins, minerals, healthy fats, and fiber, making it a nutritious and delicious meal option. Perfect as a main dish or side, it can be enhanced with grilled chicken or shrimp for added protein.",
            style: AppWidget.lightfontfiledstyle(),maxLines: 5,),
            SizedBox(height: 20,),
            Row(

              children: [
                Text('Delivery time',style: AppWidget.boldtextfiledstyle(),),
                Spacer(),
                Icon(Icons.alarm,color: Colors.black87,),
                SizedBox(width: 10,),
                Text('45min',style: AppWidget.boldtextfiledstyle(),)
              ],
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Total Price',style: AppWidget.semiboldtextfiledstyle(),),
                      Text('pkr350',style: AppWidget.boldtextfiledstyle(),)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                    child: Row(

                      children: [
                        Text('Add To Cart',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Poppins'),),
                        SizedBox(width: 20,),
                        Container(
                          width: MediaQuery.sizeOf(context).width/8,
                          padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.shopping_cart_outlined,color: Colors.white,))

                      ],
                    ),
                  )
              
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
