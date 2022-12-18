import 'package:dinajpur_blood_app/App_%20Data/app_color.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

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
    //double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppData().mainColor,
      appBar: AppBar(
        backgroundColor: AppData().appBarColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "আগের Account আছে ?",
            style: TextStyle(
                color: AppData().whiteColor.withOpacity(.5),
                fontSize: height / 25),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0c76c5),
                  ),
                  child: Center(
                      child: Text(
                    "Log In",
                    style: TextStyle(
                        color: AppData().whiteColor,
                        fontSize: height / 20,
                        fontWeight: FontWeight.bold),
                  )),
                ).onTap((){const LoginScreen().launch(context);}),
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
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0c76c5),
                  ),
                  child: Center(
                      child: Text(
                    "Registration",
                    style: TextStyle(
                        color: AppData().whiteColor,
                        fontSize: height / 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ).onTap((){
            const RegistrationScreen().launch(context);
          }),
        ],
      ),
    );
  }
}
