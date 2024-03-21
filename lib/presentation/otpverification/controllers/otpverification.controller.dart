import 'package:get/get.dart';
import 'package:yuktidea_assessment/infrastructure/dal/models/country.dart';

import '../../../infrastructure/dal/services/api_service.dart';

class OtpverificationController extends GetxController {
  var isLoading = true.obs;
  var countries = <Country>[].obs;
  var displayedCountries = <Country>[].obs;
  int currentPage = 1;
  int perPage = 100;
  var filteredCountries = <Country>[].obs;

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
}
