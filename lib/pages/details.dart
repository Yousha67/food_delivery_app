import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/database.dart';
import 'package:food_delivery_app/pages/shared_pref.dart';
import 'package:food_delivery_app/pages/widget_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Details extends StatefulWidget {
final  String image,name,detail,price;
  Details({required this.detail,required this.image,required this.name,required this.price});


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1,total=0;
  String? id;

  getthesharedpref()async{
   id= await SharedPreferenceHelper().getUserId();
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
    super.initState();
    ontheload();
    total=int.parse(widget.price);
  }

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
            Image.network(widget.image,width: MediaQuery.sizeOf(context).width,height: MediaQuery.sizeOf(context).height/2.5,fit: BoxFit.fill,),
SizedBox(height: 20.0,),
            Row(

              children: [

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(widget.name,style: AppWidget.semiboldtextfiledstyle(),),

                  ],
                ),
                Spacer(),

                GestureDetector(
                  onTap: (){
                    if(a>1){
                    --a;
                    total=total-int.parse(widget.price);
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
                    total=total+int.parse(widget.price);
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
            Text(widget.detail,
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
                      Text("pkr"+total.toString(),style: AppWidget.boldtextfiledstyle(),)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                    child: GestureDetector(
                      onTap: ()async{
                        Map<String,dynamic> addFoodToCart={
                          "Name":widget.name,
                          "Quantity":a.toString(),
                          "Total":total.toString(),
                          "Image":widget.image
                        };
                        await DatabaseMethods().addFoodToCart(addFoodToCart, id!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.orangeAccent,
                            content: Text("Food added to cart successfully!!",
                              style: TextStyle(fontSize: 18.0),)));

                      },
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
