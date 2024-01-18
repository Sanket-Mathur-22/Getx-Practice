import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxBool notification = false.obs;

  changeNotification(bool value) {
    notification.value = value;
  }
}
