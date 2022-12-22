import 'dart:io';
import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/donor_profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import '../App_ Data/app_data.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key, required this.donorEmail}) : super(key: key);
  final String? donorEmail;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _postController = TextEditingController();
  String? imageUrl1 = "null";
  String? imageUrl2 = "null";
  String? postDates;
  final ImagePicker _picker = ImagePicker();
  XFile? images1;
  XFile? images2;

  Future<void> setImages1() async {
    images1 = await _picker.pickImage(source: ImageSource.gallery);
    EasyLoading.show(status: "Uploading Image");
    var a = await FirebaseStorage.instance
        .ref("Posts Images")
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .putFile(File(images1!.path));
    imageUrl1 = await a.ref.getDownloadURL();
    EasyLoading.showSuccess("Successful");
    setState(() {});
  }

  Future<void> setImages2() async {
    images2 = await _picker.pickImage(source: ImageSource.gallery);
    EasyLoading.show(status: "Uploading Image");
    var a = await FirebaseStorage.instance
        .ref("Posts Images")
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .putFile(File(images2!.path));
    imageUrl2 = await a.ref.getDownloadURL();
    EasyLoading.showSuccess("Successful");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer(builder: (_, ref, watch) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppData().appBarColor,
          title: const Text("Write a Post"),
        ),
        backgroundColor: Colors.black.withOpacity(.5),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: width / 2.4,
                          width: width / 2.1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: images1 != null
                                    ? DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(
                                            File(images1?.path ?? "")),
                                      )
                                    : const DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage("images/userIcon.png"))),
                          ),
                        ),
                        Card(
                          surfaceTintColor: Colors.greenAccent,
                          shadowColor: AppData().mainColor,
                          elevation: 7,
                          color: AppData().whiteColor,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppData().whiteColor,
                              width: 5,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Text(
                              "Image 1 ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ).onTap(() {
                          setImages1();
                        }),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: width / 2.4,
                          width: width / 2.1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: images2 != null
                                    ? DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(
                                            File(images2?.path ?? "")),
                                      )
                                    : const DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage("images/userIcon.png"))),
                          ),
                        ),
                        Card(
                          surfaceTintColor: Colors.greenAccent,
                          shadowColor: AppData().mainColor,
                          elevation: 7,
                          color: AppData().whiteColor,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppData().whiteColor,
                              width: 5,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Text(
                              "Image 1 ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ).onTap(() {
                          setImages2();
                        }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 10),
                  child: AppTextField(
                    controller: _postController,
                    textFieldType: TextFieldType.MULTILINE,
                    textAlignVertical: TextAlignVertical.bottom,
                    maxLines: 2,
                    textStyle: GoogleFonts.questrial(
                      textStyle: TextStyle(color: AppData().whiteColor),
                    ),
                    //textStyle: TextStyle(color: AppData().whiteColor),
                    decoration: InputDecoration(
                      hintText: "Enter Your Post here",
                      hintStyle: GoogleFonts.acme(
                        textStyle: TextStyle(color: AppData().whiteColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppData().borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppData().whiteColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
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
                    child: Text("Sign Up",
                        // "রক্ত",
                        style: GoogleFonts.aubrey(
                            textStyle: TextStyle(
                                color: AppData().whiteColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold))),
                  )),
                ).onTap(() async {
                  if (_postController.text.isEmptyOrNull) {
                    toast("Please Enter a Comment");
                  } else {
                    postDates = DateTime.now().toString();
                    EasyLoading.show(status: "Uploading...");
                    DonorPostModels models = DonorPostModels(widget.donorEmail,
                        imageUrl1, imageUrl2, _postController.text, postDates);
                  await  FirebaseDatabase.instance
                        .ref("Donor Post")
                        .push()
                        .set(models.toJson());
                    EasyLoading.showSuccess("Successfully");
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('email', widget.donorEmail!);
                    var tokens = prefs.getString('email');
                    ref.refresh(postRiverpod);
                    DonorProfileScreen(
                      getTokens: tokens.toString(),
                    ).launch(context, isNewTask: true);
                  }
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
