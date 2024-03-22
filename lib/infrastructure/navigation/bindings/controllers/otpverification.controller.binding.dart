import 'package:get/get.dart';

import '../../../../presentation/otpverification/controllers/otpverification.controller.dart';

class OtpverificationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpverificationController>(
      () => OtpverificationController(),
    );
  }
}
