import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assessment/presentation/otpverification/controllers/otpverification.controller.dart';

class OtpInputScreen extends StatelessWidget {
  final OtpverificationController controller = Get.find();

  OtpInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.otpController,
              decoration: InputDecoration(labelText: 'Enter OTP'),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: controller.verifyOtp,
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
