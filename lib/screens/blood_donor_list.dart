import 'package:dinajpur_blood_app/App_%20Data/images.dart';
import 'package:flutter/material.dart';

import '../App_ Data/app_color.dart';

class BloodDonorList extends StatefulWidget {
  const BloodDonorList({Key? key}) : super(key: key);

  @override
  State<BloodDonorList> createState() => _BloodDonorListState();
}

class _BloodDonorListState extends State<BloodDonorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData().mainColor,
      appBar: AppBar(
        title: Text(
          "A+ Donor List",
          style: TextStyle(color: AppData().whiteColor, fontSize: 25),
        ),
        backgroundColor: AppData().appBarColor,
        actions: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  "All Donor",
                  style: TextStyle(color: AppData().whiteColor.withOpacity(.7)),
                ),
              ),
              CircleAvatar(
                backgroundColor: AppData().mainTextColor.withOpacity(.5),
                child: const Text(
                  "08",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (_,index){
            return  Card(
              color: Colors.white.withOpacity(.8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 5),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: AppData().appBarColor,
                      backgroundImage: NetworkImage(Images().slideImages[1]),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                        "Mamun Islam Mim",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppData().mainTextColor),
                      ),
                        Text("Blood Group : O+",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: AppData().appBarColor),),
                        Text("Given Blood 5 days ago",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: AppData().appBarColor),),
                      Row(
                        children: const [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.call,color: Colors.green,size: 35,),
                          SizedBox(
                            width: 25,
                          ),
                          Icon(Icons.sms,color: Colors.green,size: 35,),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          })

    );
  }
}
