import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import '../Models/setDonorData.dart';

class Repo {

  // Donor Repo
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

  // Post Repo
  Future<List<DonorPostModels>> getPostRepo()async{
    List<DonorPostModels> details = [];
    await FirebaseDatabase.instance.ref("Donor Post").orderByKey().get().then((value) => {
      for(var e in value.children){
        details.add(DonorPostModels.fromJson(jsonDecode(jsonEncode(e.value))))
      }
    });
    return details;
  }
}
