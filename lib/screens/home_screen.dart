import 'package:dinajpur_blood_app/App_%20Data/images.dart';
import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:dinajpur_blood_app/screens/find_blood_screen.dart';
import 'package:dinajpur_blood_app/screens/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import '../App_ Data/app_data.dart';
import 'Authentication_section/give_blood.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<List<SetDonorDataModels>> donorDetails =
          ref.watch(donorDataRiverpod);
      return donorDetails.when(data: (details) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppData().mainColor,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, right: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    backgroundImage: AssetImage("images/userIcon.png"),
                  ),
                ).onTap(() {
                  AlertDialog(
                    icon: Icon(Icons.account_circle_sharp),
                    title: Text("vcdfv"),
                  );
                })
              ],
            ),
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
                                    image:
                                        NetworkImage(Images().slideImages[a]))),
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
                      child: Text("Info",
                          style: GoogleFonts.kameron(
                            textStyle: TextStyle(
                                color: AppData().whiteColor,
                                fontSize: height / 17,
                                fontWeight: FontWeight.bold),
                          )),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
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
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "images/searchBlood.png"))),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Find",
                                        // "রক্ত",
                                        style: GoogleFonts.acme(
                                            textStyle: TextStyle(
                                          color: AppData().mainTextColor,
                                          fontSize: 25,
                                        ))),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                        // "খুঁজুন",
                                        "Blood",
                                        style: GoogleFonts.acme(
                                            textStyle: TextStyle(
                                          color: AppData().mainTextColor,
                                          fontSize: 25,
                                        ))),
                                  ],
                                ),
                              ],
                            )),
                          ),
                        ).onTap(() {
                          const FindBloodScreen().launch(context);
                        }),
                        SizedBox(
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
                                Container(
                                  height: 80,
                                  width: 145,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "images/giveBlood.png"))),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Give",
                                        // "রক্ত",
                                        style: GoogleFonts.acme(
                                            textStyle: TextStyle(
                                          color: AppData().mainTextColor,
                                          fontSize: 25,
                                        ))),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                        // "খুঁজুন",
                                        "Blood",
                                        style: GoogleFonts.acme(
                                            textStyle: TextStyle(
                                          color: AppData().mainTextColor,
                                          fontSize: 25,
                                        ))),
                                  ],
                                ),
                              ],
                            )),
                          ),
                        ).onTap(() {
                          const GiveBlood().launch(context);
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
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
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "images/emergency.png"))),
                                ),
                                Text(
                                    // "খুঁজুন",
                                    "Emergency",
                                    style: GoogleFonts.acme(
                                        textStyle: TextStyle(
                                      color: AppData().mainTextColor,
                                      fontSize: 25,
                                    ))),
                              ],
                            )),
                          ),
                        ).onTap(() {
                          const TipsScreen().launch(context);
                        }),
                        SizedBox(
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
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "images/tipsIcon.png"))),
                                ),
                                Text("Tips",
                                    // "রক্ত",
                                    style: GoogleFonts.acme(
                                        textStyle: TextStyle(
                                      color: AppData().mainTextColor,
                                      fontSize: 25,
                                    ))),
                              ],
                            )),
                          ),
                        ).onTap(() {
                          const TipsScreen().launch(context);
                        }),
                      ],
                    ),

                    const Divider(
                      thickness: 10,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // Post
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text("All Post's",
                          style: GoogleFonts.kameron(
                            textStyle: TextStyle(
                                color: AppData().whiteColor,
                                fontSize: height / 17,
                                fontWeight: FontWeight.bold),
                          )),
                    ),

                    // TextField
                    // TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "Post here..",
                    //       prefixIcon:
                    //           Icon(Icons.edit, color: AppData().whiteColor),
                    //       hintStyle: TextStyle(color: AppData().whiteColor),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           borderSide:
                    //               const BorderSide(color: Colors.white)),
                    //       disabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           borderSide:
                    //               const BorderSide(color: Colors.white)),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           borderSide:
                    //               const BorderSide(color: Colors.white))),
                    // ),

                    const SizedBox(
                      height: 10,
                    ),

                    // see Post
                    Consumer(
                      builder: (_, ref, watch) {
                        AsyncValue<List<DonorPostModels>> model =
                            ref.watch(postRiverpod);
                        return model.when(
                          data: (post) {
                            return ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: post.length,
                              itemBuilder: (_, index) {
                                return Card(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, left: 7, right: 7),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, right: 6, left: 6, bottom: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor: AppData()
                                                      .mainColor2
                                                      .withOpacity(.3),
                                                  backgroundImage: NetworkImage(
                                                    details[index]
                                                        .donorImagesUrl
                                                        .toString(),
                                                  )).visible(details[index]
                                                      .donorEmail
                                                      .toString() !=
                                                  post[index]
                                                      .donorEmail
                                                      .toString()),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Md. Mamun Islam Mim",
                                                    style: TextStyle(
                                                        color: AppData()
                                                            .mainColor2,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Blood Donate : ",
                                                        style: TextStyle(
                                                            color: AppData()
                                                                .mainTextColor
                                                                .withOpacity(
                                                                    .9),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        post[index]
                                                            .postDate
                                                            .toString()
                                                            .substring(0, 15),
                                                        style: TextStyle(
                                                            color: AppData()
                                                                .mainTextColor
                                                                .withOpacity(
                                                                    .7),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: height / 3,
                                                decoration: BoxDecoration(
                                                  color: AppData()
                                                      .mainColor2
                                                      .withOpacity(.3),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: AppData()
                                                          .mainColor2
                                                          .withOpacity(.08),
                                                      width: 5),
                                                  image: post[index]
                                                              .donorImage1
                                                              .toString() ==
                                                          "null"
                                                      ? const DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "images/noImage1.png"))
                                                      : DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                            post[index]
                                                                .donorImage1
                                                                .toString(),
                                                          )),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: height / 3,
                                                decoration: BoxDecoration(
                                                  color: AppData()
                                                      .mainColor2
                                                      .withOpacity(.3),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: AppData()
                                                          .mainColor2
                                                          .withOpacity(.08),
                                                      width: 5),
                                                  image: post[index]
                                                              .donorImage1
                                                              .toString() ==
                                                          "null"
                                                      ? const DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "images/noImage1.png"))
                                                      : DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                            post[index]
                                                                .donorImage2
                                                                .toString(),
                                                          )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: width,
                                          child: Card(
                                            color: Colors.brown.withOpacity(.1),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                post[index]
                                                    .donorPost
                                                    .toString(),
                                                style: GoogleFonts.kameron(
                                                  textStyle: TextStyle(
                                                      color: AppData()
                                                          .postTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          error: (e, stack) {
                            return Text(e.toString());
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }, error: (e, stack) {
        return Center(child: Text(e.toString()));
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
    });
  }
}
