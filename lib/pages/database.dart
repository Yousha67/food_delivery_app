import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic>userInfoMap, String Id) async {
    return await FirebaseFirestore.instance
        .collection('users').
    doc(Id).
    set(userInfoMap);
  }

  UpdateUserWallet(String Id, String amount) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(Id)
        .update({"wallet": amount});
  }

  Future addFoodItem(Map<String, dynamic>userInfoMap, String name) async {
    return await FirebaseFirestore.instance
        .collection(name).
    add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map<String, dynamic>userInfoMap, String Id) async {
    return await FirebaseFirestore.instance
        .collection('users').
    doc(Id).collection("Cart").
    add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();
  }

}