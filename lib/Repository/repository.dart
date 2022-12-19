import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import '../Models/setDonorData.dart';

class Repo {
  Future<List<SetDonorDataModels>> getDonorDetails() async {
    List<SetDonorDataModels> dataList = [];
    await FirebaseDatabase.instance
        .ref("Donor Information")
        .orderByKey()
        .get()
        .then((value) => {for (var element in value.children) {
          dataList.add(SetDonorDataModels.fromJson(jsonDecode(jsonEncode(element.value))))
    }});
    return dataList;
  }

}
