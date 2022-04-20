import 'dart:async';

import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;

  RxList<String> items = <String>[].obs;

  void increment() {
    counter.value++;
  }

  void setDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    //en listas no se jode con value
    items.add(DateTime.now().toString());
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}
