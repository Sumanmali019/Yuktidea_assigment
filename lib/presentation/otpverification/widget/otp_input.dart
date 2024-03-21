import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assessment/presentation/otpverification/controllers/otpverification.controller.dart';
import 'package:yuktidea_assessment/presentation/otpverification/widget/custom_back.dart';
import 'package:yuktidea_assessment/presentation/otpverification/widget/custon_button.dart';

class OtpInputScreen extends StatelessWidget {
  final OtpverificationController controller = Get.find();

  OtpInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve 'telCode' from the arguments
    final telCode = Get.arguments['telCode'] as String?;
    if (telCode == null) {
      // If 'telCode' is not found, show an error and return to the previous screen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Error', 'Country code is required.');
        Get.back();
      });
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        leading: CrossIconbackButton(
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Verify Number',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    'Please enter the OTP received to',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(217, 137, 106, 1),
                    ),
                  ),
                  Text(
                    'verify your number',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(217, 137, 106, 1),
                    ),
                  ),
                  Image.asset('assets/images/Divider.png')
                ],
              ),
            ),
            TextField(
              controller: controller.otpController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            CustomButton(
              buttonText: 'Verify',
              onTap: () {
                if (telCode != null) {
                  controller.verifyOtp(telCode);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
