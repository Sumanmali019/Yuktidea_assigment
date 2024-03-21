import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/otpverification.controller.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  EnterPhoneNumberScreen({Key? key}) : super(key: key);

  final OtpverificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.telCode = Get.arguments['telCode'] ?? '';
    // Get the arguments safely
    // final telCode = Get.arguments['telCode'] as String?;

    // If 'telCode' is null, we do not proceed and show a snackbar instead.
    // if (telCode == null) {
    //   Future.delayed(Duration.zero, () {
    //     Get.snackbar('Error', 'Country code is required.');
    //     Get.back();
    //   });
    // }

    return Scaffold(
      appBar: AppBar(title: Text('Enter Your Phone Number')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixText: controller.telCode,
              ),
              keyboardType: TextInputType.phone,
            ),
            ElevatedButton(
              onPressed: () => controller.requestOtp(controller.telCode),
              child: Text('Get OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
