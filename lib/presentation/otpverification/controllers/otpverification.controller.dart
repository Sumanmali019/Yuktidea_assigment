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
        displayedCountries
            .assignAll(countriesList); // Populate displayedCountries
        filteredCountries.assignAll(
            countriesList); // Initially, filteredCountries shows all countries
        // No need to call loadMore() initially if we're showing all countries
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

  void loadMore() {
    int startIndex = (currentPage - 1) * perPage;
    int endIndex = startIndex + perPage;
    if (startIndex < countries.length) {
      displayedCountries.addAll(countries.sublist(startIndex,
          endIndex > countries.length ? countries.length : endIndex));
      currentPage++;
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

  void verifyOtp() async {
    isLoadingphone(true);
    final success =
        await apiService.verifyOtp(otpController.text, phoneController.text);
    isLoadingphone(false);
    if (success) {
      Get.snackbar("Success", "Phone verified successfully");
    } else {
      Get.snackbar("Error", "OTP verification failed");
    }
  }
}
