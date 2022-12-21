
import 'package:dinajpur_blood_app/App_%20Data/app_data.dart';
import 'package:flutter/material.dart';

class EmergencyHelpScreen extends StatefulWidget {
  const EmergencyHelpScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyHelpScreen> createState() => _EmergencyHelpScreenState();
}

class _EmergencyHelpScreenState extends State<EmergencyHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppData().mainColor,
    );
  }
}
