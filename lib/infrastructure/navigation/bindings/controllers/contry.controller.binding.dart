import 'package:get/get.dart';

import '../../../../presentation/contry/controllers/contry.controller.dart';

class ContryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContryController>(
      () => ContryController(),
    );
  }
}
