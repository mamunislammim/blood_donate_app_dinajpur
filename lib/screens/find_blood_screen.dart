import 'package:dinajpur_blood_app/App_%20Data/app_data.dart';
 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
     // backgroundColor: AppData().mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Find Blood",
          style: GoogleFonts.zenDots(
            textStyle: TextStyle(color: AppData().whiteColor, fontSize: 26,fontWeight: FontWeight.normal)
          ),
        ),
        backgroundColor: AppData().appBarColor,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5,bottom: 5),
          itemCount: 8,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            //childAspectRatio: .9,
          ),
          itemBuilder: (_, index) {
            return  SizedBox(
              height: width / 2.4,
              width: width / 2.1,
              child: Card(
                surfaceTintColor: Colors.greenAccent,
                shadowColor: AppData().mainColor,
                elevation: 7,
                color: AppData().whiteColor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppData().whiteColor,
                      width: 5,
                    )),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                        AppData().bloodGroup[index],
                            // "রক্ত",
                            style: GoogleFonts.lancelot(
                                textStyle: TextStyle(
                                  color: AppData().mainTextColor,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold
                                ))),
                      ],
                    )),
              ),
            ).onTap(() {
                BloodDonorList(getBloodGroup: AppData().bloodGroup[index],).launch(context);
            });
          }),
    );
  }
}


