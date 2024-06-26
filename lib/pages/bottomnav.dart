import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/profilepage.dart';
import 'package:food_delivery_app/pages/walletpage.dart';

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
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
