import 'package:get/get.dart';

class StatusController extends GetxController {
  RxBool active = false.obs;

  void activeStutus() {
    active.value = true;
  }

  void inactiveStatus() {
    active.value = false;
  }
}
