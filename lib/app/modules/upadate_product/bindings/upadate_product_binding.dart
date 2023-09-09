import 'package:get/get.dart';

import '../controllers/upadate_product_controller.dart';

class UpadateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpadateProductController>(
      () => UpadateProductController(),
    );
  }
}
