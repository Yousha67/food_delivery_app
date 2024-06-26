import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/profilepage.dart';
import 'package:food_delivery_app/pages/walletpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../home.dart';
import 'orderpage.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currenttabindex = 0;
  late Widget currentpage;
  late List<Widget>pages;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;
  @override
  @override
  void initState() {
    homepage = Home();
    profile = Profile();
    order = Order();
    wallet = Wallet();
    pages=[homepage,order,wallet,profile];
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.black,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currenttabindex=index;
          });
        },
        items: [

        Icon(Icons.home_outlined,color: Colors.black,),
        Icon(Icons.shopping_bag_outlined,color:  Colors.black,),
        Icon(Icons.wallet_outlined,color: Colors.black,),
        Icon(Icons.person_outline,color: Colors.black,),
      ],),
      body: pages[currenttabindex],



    );
  }
}
