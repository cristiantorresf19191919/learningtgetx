import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;

  RxString get message => _message;

  late Timer _timer;

  final _faker = Faker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _init();
  }

  // useEffect(() => {
  //   ...........
  //   return (){
  //     timer.clearInterval();
  //   }
  // },[])

  _init() {
    //memory leaks
    // const timer = setInterval(() => {message.value = bausar()},5000);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
}
