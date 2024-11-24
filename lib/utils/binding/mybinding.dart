import 'package:clock_app/controller/homecontroller.dart';
import 'package:get/get.dart';

class MyBinding  extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}