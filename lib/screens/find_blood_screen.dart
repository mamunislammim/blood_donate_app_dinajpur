import 'package:dinajpur_blood_app/App_%20Data/app_color.dart';
 import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'blood_donor_list.dart';

class FindBloodScreen extends StatefulWidget {
  const FindBloodScreen({Key? key}) : super(key: key);

  @override
  State<FindBloodScreen> createState() => _FindBloodScreenState();
}

class _FindBloodScreenState extends State<FindBloodScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppData().mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Find Blood",
          style: TextStyle(color: AppData().whiteColor, fontSize: 26),
        ),
        backgroundColor: AppData().appBarColor,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          itemCount: 8,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            //childAspectRatio: .9,
          ),
          itemBuilder: (_, index) {
            return Container(
              width: width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                    colors: [AppData().mainColor, AppData().mainTextColor],
                    end: Alignment.topRight,
                    begin: Alignment.bottomRight),
                color: Colors.pink,
              ),
              child: Center(
                  child: Text(
                AppData().bloodGroup[index],
                style: TextStyle(
                    color: AppData().whiteColor, fontSize: height / 10),
              )),
            ).onTap(() {

              const BloodDonorList().launch(context);
            });
          }),
    );
  }
}
