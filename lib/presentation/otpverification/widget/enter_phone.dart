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
        leading: CrossIconbackButton(onPressed: () {
          controller.phoneController.clear();
          controller.isFormValid.value = false;
          Get.back();
        }),
      ),
      backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter phone number',
                      style: TextStyle(
                          fontSize: 26,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    const Text(
                      'Please enter your 10 digit mobile',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(217, 137, 106, 1),
                      ),
                    ),
                    const Text(
                      'number to receive OTP',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(217, 137, 106, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Image.asset('assets/images/Divider.png')
                  ],
                ),
              ),
              // SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Form(
                  key: controller.formKey,
                  child: TextFormField(
                    controller: controller.phoneController,
                    onChanged: (value) => controller.validateForm(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Number cannot be empty';
                      }
                      if (value.length < 10) {
                        return 'Please enter a valid mobile number';
                      }
                      if (value.length > 10) {
                        return 'Number must be at least 10 digits';
                      }
                      if (value.contains(RegExp(r'[^\d]'))) {
                        // Check for non-digit characters
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10),
                      hintText: '9999999999',
                      hintStyle:
                          const TextStyle(color: Colors.white38, fontSize: 18),
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.network(
                              flagUrl,
                              width: 35,
                              height: 22,
                              fit: BoxFit.cover,
                              placeholderBuilder: (context) =>
                                  const CircularProgressIndicator(),
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Text(
                              telCode,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(125, 126, 128, 1),
                            width: 1.0),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),

              Obx(() => CustomButton(
                    buttonText: 'Get OTP',
                    onTap: controller.isFormValid.value
                        ? () => controller.studentrequestOtp(telCode)
                        : null,
                    color: controller.isFormValid.value
                        ? const Color.fromRGBO(249, 211, 180, 1)
                        : const Color.fromRGBO(249, 211, 180, 0.4),
                  )),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
