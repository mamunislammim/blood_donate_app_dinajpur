import 'package:dinajpur_blood_app/screens/Authentication_section/login_screen.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/set_donor_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../App_ Data/app_color.dart';
import 'donor_profile.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: AppData().mainColor,
      body: ListView(
        padding: EdgeInsets.only(
          top: height / 4,
          left: width / 13,
          right: width / 13,
        ),
        children: [
          AppTextField(
            controller: _email,
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
            controller: _password,
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
                      "Sign Up",
                      style: TextStyle(
                          color: AppData().whiteColor,
                          fontSize: height / 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ).onTap(() async {
                  if (_email.text.isEmptyOrNull) {
                    toast("Enter Email Address");
                  } else if (_password.text.isEmptyOrNull) {
                    toast("Enter Password");
                  }  else if(_password.text.length < 6){
                    toast("Password at least 6 digit");
                  }
                  else {
                    try {
                      EasyLoading.show(status: "Signing Up");
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _email.text, password: _password.text);

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', _email.text);

                      EasyLoading.showSuccess("Sign up Successful");
                       RegistrationScreen()
                          .launch(context, isNewTask: true);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        EasyLoading.showError("The password provided is too weak");
                      } else if (e.code == 'email-already-in-use') {
                         EasyLoading.showError("The account already exists for that email");
                      }
                    }
                  }
                }),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Already have an Account ?",
                style: TextStyle(color: AppData().whiteColor.withOpacity(.8)),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Log in",
                style:
                    TextStyle(color: Colors.blue.withOpacity(.8), fontSize: 18),
              ).onTap(() {
              const LoginScreen().launch(context);
              }),
            ],
          )
        ],
      ),
    );
  }
}
