import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
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
                        'Verify Number',
                        style: TextStyle(
                            fontSize: 26,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      const Text(
                        'Please enter the OTP received to',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(217, 137, 106, 1),
                        ),
                      ),
                      const Text(
                        'verify your number',
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
                OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: Colors.white,
                        enabledBorderColor: Colors.white,
                        borderColor: Colors.white,
                        disabledBorderColor: Colors.white),
                    // controller: controller.otpController,
                    length: 4,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1)),
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    // fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    onChanged: (pin) {
                      controller.otpController.text = pin;
                      controller.validateOtp(pin);
                    },
                    onCompleted: (pin) {
                      controller.validateOtp(pin);
                    }),
                Obx(() => CustomButton(
                      buttonText: 'Verify',
                      onTap: () {
                        if (controller.isOtpValid.value &&
                            !controller.isLoadingphone.value) {
                          controller.verifyOtp(telCode!);
                        }
                      },
                      color: controller.isOtpValid.value
                          ? const Color.fromRGBO(249, 211, 180, 1)
                          : const Color.fromRGBO(249, 211, 180, 0.4),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
