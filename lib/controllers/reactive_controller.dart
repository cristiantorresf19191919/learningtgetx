import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_demo/controllers/socket_client_controller.dart';
import 'package:getx_demo/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;

  RxList<String> items = <String>[].obs;
  RxMap<String, dynamic> mapItems = <String, dynamic>{}.obs;

  Pet myPet = Pet(name: "Rocko", age: 1);

  late StreamSubscription<String> _subscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final socketController = Get.find<SocketClientController>();
    _subscription = socketController.message
        // ignore: avoid_print
        .listen((String data) {});
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _subscription.cancel();
    super.onClose();
  }

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

  void addMapItem() {
    final String key = DateTime.now().toString();
    mapItems[key] = key;
  }

  void deleteMapItem(String key) {
    mapItems.remove(key);
  }

  void setPetAge(int age) {
    // myPet.value = myPet.value.copyWith(age: age);
    myPet.age = age;
  }
}
