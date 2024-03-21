import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assessment/infrastructure/dal/models/country.dart';
import 'package:yuktidea_assessment/presentation/otpverification/widget/otp_input.dart';

import '../../../infrastructure/dal/services/api_service.dart';

class OtpverificationController extends GetxController {
  var isLoading = true.obs;
  var countries = <Country>[].obs;
  var displayedCountries = <Country>[].obs;
  int currentPage = 1;
  int perPage = 100;
  var filteredCountries = <Country>[].obs;

  final RxBool isLoadingphone = false.obs;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String telCode = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isButtonPressed = false;
  var isFormValid = false.obs;

  void validateForm() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  var otpErrorMessage = ''.obs;
  var isOtpValid = false.obs;

  void validateOtp(String otp) {
    if (otp.isEmpty || otp.contains(RegExp(r'[^\d]')) || otp.length != 4) {
      isOtpValid.value = false;
      otpErrorMessage.value = 'Invalid OTP. Please try again.';
    } else {
      isOtpValid.value = true;
      otpErrorMessage.value = '';
    }
    isOtpValid.value = true;
  }

  ApiService apiService = ApiService();
  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  void fetchCountries() async {
    try {
      isLoading(true);
      var countriesList = await apiService.getCountries();
      if (countriesList.isNotEmpty) {
        countries.assignAll(countriesList);
        displayedCountries.assignAll(countriesList);
        filteredCountries.assignAll(countriesList);
      }
    } finally {
      isLoading(false);
    }
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.assignAll(displayedCountries);
    } else {
      filteredCountries.assignAll(
        displayedCountries
            .where(
              (country) =>
                  country.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      );
    }
  }

  void requestOtp(String telCode) async {
    final success = await apiService.requestOtp(telCode, phoneController.text);
    isLoadingphone(false);
    if (success && isFormValid.value) {
      Get.to(() => OtpInputScreen(), arguments: {'telCode': telCode});
    } else {
      Get.snackbar("Error", "Failed to request OTP");
    }
  }

  // void verifyOtp(
  //   String telCode,
  // ) async {
  //   isLoadingphone(true);
  //   String fullPhoneNumber = telCode + phoneController.text;
  //   final success =
  //       await apiService.verifyOtp(otpController.text, fullPhoneNumber);
  //   isLoadingphone(false);
  //   if (success) {
  //     Get.snackbar("Success", "Phone verified successfully");
  //     Get.toNamed('/home');
  //   } else {
  //     Get.snackbar("Error", "OTP verification failed");
  //   }
  // }
  // void verifyOtp(String telCode) async {
  //   isLoadingphone(true);

  //   bool isValidOtp = await apiService.verifyOtp(otpController.text, telCode);
  //   isLoadingphone(false);

  //   if (isValidOtp) {
  //     Get.to(() => OtpInputScreen(), arguments: {'telCode': telCode});
  //   } else {
  //     isOtpValid.value = false;
  //     otpErrorMessage.value = 'OTP does not match, please try again.';
  //   }
  // }

  void verifyOtp(String telCode) async {
    if (otpController.text.isEmpty ||
        otpController.text.contains(RegExp(r'[^\d]')) ||
        otpController.text.length != 4) {
      // Pre-validation before making an API call
      isOtpValid.value = false;
      otpErrorMessage.value = 'Invalid OTP. Please try again.';
      return;
    }

    isLoadingphone(true);
    bool isValidOtp = await apiService.verifyOtp(otpController.text, telCode);
    isLoadingphone(false);

    if (isValidOtp) {
      isOtpValid.value = true;
      otpErrorMessage.value = '';
      Get.to(() => OtpInputScreen(), arguments: {'telCode': telCode});
    } else {
      isOtpValid.value = false;
      otpErrorMessage.value = 'OTP does not match, please try again.';
    }
  }
}
