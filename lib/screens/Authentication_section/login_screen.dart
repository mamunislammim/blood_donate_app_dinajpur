import 'package:dinajpur_blood_app/App_%20Data/app_color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppData().mainColor,
      body: ListView(
        padding: EdgeInsets.only(
          top: height / 4,
          left: width / 13,
          right: width / 13,
        ),
        children: [
          AppTextField(
            textStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
            textFieldType: TextFieldType.EMAIL,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppData().whiteColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppData().whiteColor)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppData().whiteColor)),
              hintText: "email@gmail.com",
              hintStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
              prefixIcon: Icon(
                Icons.email,
                color: AppData().whiteColor.withOpacity(.6),
              ),
            ),
          ),
          SizedBox(
            height: height / 20,
          ),
          AppTextField(
            textStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
            textFieldType: TextFieldType.PASSWORD,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppData().whiteColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppData().whiteColor)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppData().whiteColor)),
              hintText: "******",
              hintStyle: TextStyle(color: AppData().whiteColor.withOpacity(.6)),
              prefixIcon: Icon(
                Icons.security_outlined,
                color: AppData().whiteColor.withOpacity(.6),
              ),
            ),
          ),
          SizedBox(
            height: height / 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
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
                    ),
                  ),
                ).onTap(() {}),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Forget Password .?",
            style: TextStyle(color: AppData().whiteColor.withOpacity(.8)),
          ).onTap(() {})
        ],
      ),
    );
  }
}
