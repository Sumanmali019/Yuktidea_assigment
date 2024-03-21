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

  var isOtpValid = false.obs;

  void validateOtp(String otp) {
    if (otp.isEmpty) {
      isOtpValid.value = false;
      return;
    }
    if (otp.contains(RegExp(r'[^\d]'))) {
      // Checking for non-digit characters
      isOtpValid.value = false;
      return;
    }
    // Assuming 4 is the length of a valid OTP. Adjust as necessary.
    if (otp.length != 4) {
      isOtpValid.value = false;
      return;
    }

    // Additional check for OTP correctness can go here, possibly involving an API call
    // For now, let's assume it's valid if above conditions are met
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

  void verifyOtp(
    String telCode,
  ) async {
    isLoadingphone(true);
    String fullPhoneNumber = telCode + phoneController.text;
    final success =
        await apiService.verifyOtp(otpController.text, fullPhoneNumber);
    isLoadingphone(false);
    if (success) {
      Get.snackbar("Success", "Phone verified successfully");
      Get.toNamed('/home');
    } else {
      Get.snackbar("Error", "OTP verification failed");
    }
  }
}
