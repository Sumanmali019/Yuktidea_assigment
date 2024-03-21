import 'package:get/get.dart';

import '../../../../presentation/optscreen/controllers/optscreen.controller.dart';

class OptscreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptscreenController>(
      () => OptscreenController(),
    );
  }
}
