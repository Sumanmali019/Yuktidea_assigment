import 'package:get/get.dart';

import '../../../../presentation/contryselexted/controllers/contryselexted.controller.dart';

class ContryselextedControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContryselextedController>(
      () => ContryselextedController(),
    );
  }
}
