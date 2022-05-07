import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  final RxString _message = "".obs;
  RxString get message => _message;
  final RxInt _counter = 0.obs;
  final RxString _searchText = "".obs;

  late Timer _timer;

  final _faker = Faker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _init();
  }

  _init() {
    // ever(_searchText, (_) {
    //   print("Search text has changed 😘😘😘");
    // });
    //computed worker
    // ever(_counter, (_) {
    //   print("Counter has been changed >>  ${_counter.value}");
    // });

    once(_counter, (_) {
      print("The counter had been changed for first time 😘 ${_counter}");
    });
    //delay perfecto para llamadas apis
    // espera que termine de typear
    debounce(_searchText, (_) {
      print("Debounce worker _searchText  🎉 🎉🎉 ${_searchText.value}");
    }, time: const Duration(milliseconds: 500));
    //todo el tiemoi

    interval(_searchText, (_) {
      print("Searchtext interval 👌 ${_searchText.value}");
    }, time: const Duration(milliseconds: 600));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _message.value = _faker.lorem.sentence();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    if (_timer != null) {
      _timer.cancel();
    }
    super.onClose();
  }

  void setSearchText(String text) {
    _searchText.value = text;
    // update(['text']);
  }
}
