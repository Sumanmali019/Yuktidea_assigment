import 'package:get/get.dart';

import '../../../../presentation/startup/controllers/startup.controller.dart';

class StartupControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartupController>(
      () => StartupController(),
    );
  }
}
