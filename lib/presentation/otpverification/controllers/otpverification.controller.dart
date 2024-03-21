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
    isLoadingphone(true);
    final success = await apiService.requestOtp(telCode, phoneController.text);
    isLoadingphone(false);
    if (success) {
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
