import 'package:dinajpur_blood_app/App_%20Data/app_data.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../App_ Data/app_data.dart';
import '../../App_ Data/app_data.dart';
import 'login_screen.dart';

class GiveBlood extends StatefulWidget {
  const GiveBlood({Key? key}) : super(key: key);

  @override
  State<GiveBlood> createState() => _GiveBloodState();
}

class _GiveBloodState extends State<GiveBlood> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppData().mainColor2,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height / 3,
              width: width / 1.2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/loginPic.png"))),
            ),
            SizedBox(
              height: height / 10,
            ),
            Text(
              "আগের Account আছে ?",
              style: TextStyle(
                  color: AppData().whiteColor.withOpacity(.5),
                  fontSize: height / 25),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    surfaceTintColor: Colors.greenAccent,
                    shadowColor: AppData().mainColor2,
                    elevation: 7,
                    color: AppData().mainColor,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppData().mainColor,
                          width: 5,
                        )),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Log In",
                          // "রক্ত",
                          style: GoogleFonts.aubrey(
                              textStyle: TextStyle(
                                  color: AppData().whiteColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold))),
                    )),
                  ).onTap(() {
                    const LoginScreen().launch(context);
                  }),
                ),
              ],
            ),
            SizedBox(
              height: height / 10,
            ),
            Text(
              "নতুন Account খুলুন ",
              style: TextStyle(
                  color: AppData().whiteColor.withOpacity(.5),
                  fontSize: height / 25),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    surfaceTintColor: Colors.greenAccent,
                    shadowColor: AppData().mainColor2,
                    elevation: 7,
                    color: AppData().mainColor,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppData().mainColor,
                          width: 5,
                        )),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Registration",
                          // "রক্ত",
                          style: GoogleFonts.aubrey(
                              textStyle: TextStyle(
                                  color: AppData().whiteColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold))),
                    )),
                  ),
                ),
              ],
            ).onTap(() {
              const SignUp().launch(context);
            }),
          ],
        ),
      ),
    );
  }
}
