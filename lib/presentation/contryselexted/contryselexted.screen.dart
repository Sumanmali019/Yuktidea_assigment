import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_assessment/presentation/screens.dart';
import '../otpverification/widget/custom_back.dart';
import '../otpverification/widget/custon_button.dart';
import 'controllers/contryselexted.controller.dart';

class ContryselextedScreen extends GetView<ContryselextedController> {
  const ContryselextedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        appBar: AppBar(
          leading: CrossIconbackButton(onPressed: () {
            Get.back();
          }),
          backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
               const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: 'Logout',
                  onTap: () {
                    // Get.to(StartupScreen());
                    Get.to(() => StartupScreen());
                  },
                  color: Color.fromRGBO(249, 211, 180, 1),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonText: 'Delete User',
                  onTap: () {
                    Get.to(() => StartupScreen());
                  },
                  color: Color.fromRGBO(249, 211, 180, 1),
                ),
              ]),
        ));
  }
}
