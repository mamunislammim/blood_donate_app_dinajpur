import 'package:dinajpur_blood_app/App_%20Data/app_data.dart';
import 'package:dinajpur_blood_app/Models/setDonorData.dart';
import 'package:dinajpur_blood_app/State_management/riverpod.dart';
import 'package:dinajpur_blood_app/screens/Authentication_section/edit_profile.dart';
import 'package:dinajpur_blood_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../post_screen.dart';

class DonorProfileScreen extends StatefulWidget {
  const DonorProfileScreen({Key? key, required this.getTokens})
      : super(key: key);
  final String getTokens;

  @override
  State<DonorProfileScreen> createState() => _DonorProfileScreenState();
}

class _DonorProfileScreenState extends State<DonorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: AppData().appBarColor,
          child: const Icon(Icons.arrow_back),
        ).onTap(() {
          const HomePage().launch(context);
        }),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: AppData().mainColor2.withOpacity(.3),
      body: Consumer(builder: (_, ref, watch) {
        AsyncValue<List<SetDonorDataModels>> model =
            ref.watch(donorDataRiverpod);
        return model.when(data: (data) {
          return RefreshIndicator(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              height: 150,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      opacity: .8,
                                      image: NetworkImage(
                                          "https://media.gettyimages.com/id/969226260/vector/world-blood-donor-day-on-black-background-with-paper-cut-text-vector-illustration.jpg?s=612x612&w=gi&k=20&c=VfgCRfzaaTBenMFexSPdb5i5V0A9kvVQPpm8QP8gG8M="),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, right: 8),
                              padding: const EdgeInsets.only(
                                  top: 3, bottom: 3, right: 3, left: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppData().appBarColor),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: AppData().mainTextColor,
                                  ),
                                  Text(
                                    "Edit Profile",
                                    style: GoogleFonts.acme(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: AppData()
                                              .whiteColor
                                              .withOpacity(.8)),
                                    ),
                                  ),
                                ],
                              ),
                            ).onTap(() {
                              EditProfileScreen(
                                donorData: data[index],
                              ).launch(context);
                            }),
                            Positioned(
                                left: 5,
                                bottom: -55,
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: AppData().appBarColor,
                                    backgroundImage: data[index]
                                                .donorImagesUrl
                                                .toString() !=
                                            "null"
                                        ? NetworkImage(data[index]
                                            .donorImagesUrl
                                            .toString())
                                        : const NetworkImage(
                                            "https://www.shareicon.net/data/2016/05/26/771188_man_512x512.png"))),
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(""),
                            ),
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 10),
                                child: Text(
                                  data[index].donorName.toString(),
                                  style: GoogleFonts.epilogue(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: AppData()
                                            .mainColor2
                                            .withOpacity(.8)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 10),
                              child: Text(
                                data[index].donorEmail.toString(),
                                style: GoogleFonts.anaheim(
                                  textStyle: TextStyle(
                                      fontSize: 17,
                                      color: AppData()
                                          .mainTextColor
                                          .withOpacity(.8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.call,
                                  color: Colors.green,
                                ),
                                Text(
                                  data[index].donorPhone.toString(),
                                  style: GoogleFonts.marvel(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        color: AppData()
                                            .mainTextColor
                                            .withOpacity(.8)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.bloodtype,
                                  color: Colors.red,
                                ),
                                Text(
                                  data[index].donorBloodGroup.toString(),
                                  style: GoogleFonts.marvel(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: AppData()
                                            .mainTextColor
                                            .withOpacity(.8)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.account_circle_sharp,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  data[index].donorGender.toString(),
                                  style: GoogleFonts.marvel(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color: AppData()
                                            .mainTextColor
                                            .withOpacity(.8)),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                            child: Text("Create a Post",
                                // "রক্ত",
                                style: GoogleFonts.aubrey(
                                    textStyle: TextStyle(
                                        color: AppData().whiteColor,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold))),
                          )),
                        ).onTap(() {
                          PostScreen(
                            donorEmail: data[index].donorEmail.toString(),
                          ).launch(context);
                        }),

                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          " Your Posts",
                          style: GoogleFonts.acme(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: AppData().mainColor2),
                          ),
                        ),
                        // Posts
                        Consumer(builder: (_, ref, watch) {
                          AsyncValue<List<DonorPostModels>> model =
                              ref.watch(postRiverpod);
                          return model.when(data: (post) {
                            return ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: post.length,
                                itemBuilder: (_, index) {
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 20,left: 7,right: 7),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Date : ",
                                                  style: TextStyle(
                                                      color:
                                                          AppData().mainColor2,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  post[index]
                                                      .postDate
                                                      .toString()
                                                      .substring(0, 15),
                                                  style: TextStyle(
                                                      color:
                                                          AppData().mainColor2,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
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
                                                        BorderRadius.circular(
                                                            10),
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
                                                        BorderRadius.circular(
                                                            10),
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
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                post[index]
                                                    .donorPost
                                                    .toString(),
                                                style: GoogleFonts.kameron(
                                                  textStyle:   TextStyle(
                                                      color: AppData().mainColor2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ).visible(post[index].donorEmail.toString() ==
                                      widget.getTokens.toString());
                                });
                          }, error: (e, stack) {
                            return Text(e.toString());
                          }, loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                        })
                      ],
                    ).visible(data[index].donorEmail.toString() ==
                        widget.getTokens.toString());
                  }),
              onRefresh: () {
                return Future<void>.delayed(Duration(seconds: 5));
              });
        }, error: (e, stack) {
          return const Text("");
        }, loading: () {
          return const CircularProgressIndicator();
        });
      }),
    );
  }
}
