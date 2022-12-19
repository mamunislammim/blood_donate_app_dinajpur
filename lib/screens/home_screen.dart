import 'package:dinajpur_blood_app/App_%20Data/images.dart';
import 'package:dinajpur_blood_app/screens/find_blood_screen.dart';
import 'package:dinajpur_blood_app/screens/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nb_utils/nb_utils.dart';
import '../App_ Data/app_color.dart';
import 'emergency_help_screen.dart';
import 'Authentication_section/give_blood.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppData().mainColor,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(5),
                  child: CarouselSlider.builder(
                    itemCount: 2,
                    itemBuilder: (_, a, b) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(Images().slideImages[a]))),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      // autoPlayCurve: Curves.elasticIn,
                      // clipBehavior: Clip.antiAliasWithSaveLayer
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Info
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Text(
                    "Info",
                    style: TextStyle(
                        color: AppData().whiteColor,
                        fontSize: height / 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Information
                Card(
                  margin: EdgeInsets.zero,
                  color: const Color(0xffaf0e44),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 8, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height / 5,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: height * .02,
                                      bottom: height * .02,
                                      left: width * .06,
                                      right: width * .06),
                                  child: Column(
                                    children: [
                                      Text(
                                        "রক্ত",
                                        style: TextStyle(
                                            color: AppData().mainTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 22),
                                      ),
                                      Text(
                                        "খুঁজুন ",
                                        style: TextStyle(
                                            color: AppData().mainTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ).onTap(() {
                                const FindBloodScreen().launch(context);
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: height * .02,
                                      bottom: height * .02,
                                      left: width * .06,
                                      right: width * .06),
                                  child: Column(
                                    children: [
                                      Text(
                                        "রক্ত",
                                        style: TextStyle(
                                            color: AppData().mainTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 22),
                                      ),
                                      Text(
                                        "দিন",
                                        style: TextStyle(
                                            color: AppData().mainTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ).onTap(() {
                                const GiveBlood().launch(context);
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: height * .02,
                                      bottom: height * .02,
                                      left: width * .06,
                                      right: width * .06),
                                  child: Column(
                                    children: [
                                      Text(
                                        "জরুরী",
                                        style: TextStyle(
                                            color: AppData().mainTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 22),
                                      ),
                                      Text(
                                        "সেবা",
                                        style: TextStyle(
                                            color: AppData().mainTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ).onTap(() {
                                const EmergencyHelpScreen().launch(context);
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: height * .02,
                                      bottom: height * .02,
                                      left: width * .06,
                                      right: width * .06),
                                  child: Center(
                                    child: Text(
                                      "টিপস",
                                      style: TextStyle(
                                          color: AppData().mainTextColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: height / 22),
                                    ),
                                  ),
                                ),
                              ).onTap(() {
                                const TipsScreen().launch(context);
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                // Post
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Post",
                    style: TextStyle(
                        color: AppData().whiteColor,
                        fontSize: height / 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // TextField
                TextField(
                  decoration: InputDecoration(
                      hintText: "Post here..",
                      prefixIcon: Icon(Icons.edit, color: AppData().whiteColor),
                      hintStyle: TextStyle(color: AppData().whiteColor),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white))),
                ),

                const SizedBox(
                  height: 10,
                ),

                // see Post
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Images().slideImages.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Card(
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Container(
                              height: height / 3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        Images().slideImages[index],
                                      ))),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "When the user selects an option from the dropdown list it displays the option on the button. If we want to ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
