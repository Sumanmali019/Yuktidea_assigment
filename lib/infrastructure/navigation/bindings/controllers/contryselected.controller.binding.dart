import 'package:get/get.dart';

import '../../../../presentation/contryselected/controllers/contryselected.controller.dart';

class ContryselextedControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContryselextedController>(
      () => ContryselextedController(),
    );
  }
}
