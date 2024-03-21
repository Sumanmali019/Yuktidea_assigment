import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuktidea_assessment/presentation/otpverification/controllers/otpverification.controller.dart';
import 'package:yuktidea_assessment/presentation/otpverification/widget/custom_back.dart';
import 'package:yuktidea_assessment/presentation/otpverification/widget/custon_button.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  final String telCode;
  final String flagUrl;

  final OtpverificationController controller = Get.find();
  EnterPhoneNumberScreen({
    Key? key,
    required this.telCode,
    required this.flagUrl,
  }) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        leading: CrossIconbackButton(
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Color.fromRGBO(41, 41, 41, 1),
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
                    'Enter phone number',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    'Please enter your 10 digit mobile',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(217, 137, 106, 1),
                    ),
                  ),
                  Text(
                    'number to receive OTP',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(217, 137, 106, 1),
                    ),
                  ),
                  Image.asset('assets/images/Divider.png')
                ],
              ),
            ),
            // SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 36.0, right: 36),
              child: TextFormField(
                controller: controller.phoneController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '999999999',
                  hintStyle: const TextStyle(color: Colors.white38),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.network(
                      flagUrl,
                      width: 32,
                      height: 20,
                      fit: BoxFit.cover,
                      placeholderBuilder: (context) =>
                          const CircularProgressIndicator(),
                    ),
                  ),
                  prefixText: telCode,
                  prefixStyle:
                      const TextStyle(color: Colors.white, fontSize: 16),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              buttonText: 'Get Otp',
              onTap: () {
                controller.requestOtp(telCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
