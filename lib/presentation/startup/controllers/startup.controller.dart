import 'package:get/get.dart';
import 'package:yuktidea_assessment/infrastructure/dal/services/api_service.dart';

class StartupController extends GetxController {
  var isLoading = true.obs;
  ApiService apiService =
      ApiService(); // Assuming ApiService is already defined

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      // Example of fetching data at startup (you can adjust according to your needs)
      await apiService.getTermsAndConditions();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Failed to fetch startup data');
    }
  }
}
