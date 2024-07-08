import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addUserDetail(Map<String,dynamic>userInfoMap,String Id)async{

    return await FirebaseFirestore.instance
        .collection('users').
    doc(Id).
    set(userInfoMap);

  }
  UpdateUserWallet(String Id,String amount)async{

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(Id)
        .update({"wallet":amount});
  }

}