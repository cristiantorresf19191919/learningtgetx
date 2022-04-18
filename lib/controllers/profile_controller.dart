import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class ProfileController extends GetxController {
  late User _user;

  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Get.arguments;
    _user = Get.arguments as User; // casting
  }

  void onInputTextChanged(String text) {
    _inputText = text;
  }

  void goToBackWithData() {
    if (_inputText.trim().length > 0) {
      Get.back(result: _inputText); //luego pasamos el parametro
    } else {
      //show dialog si no es string valido
      showCupertinoModalPopup(
          context: Get.overlayContext!,
          builder: (_) => CupertinoActionSheet(
                title: Text("ERROR"),
                message: Text("Ingrese un dato valido"),
                cancelButton: CupertinoActionSheetAction(
                  child: Text('ACEPTAR'),
                  onPressed: () => Get.back(),
                ),
              ));

      // Get.dialog(AlertDialog(
      //   title: Text("Error"),
      //   content: Text("Ingrese un valod valido"),
      //   actions: [
      //     FlatButton(
      //         onPressed: () {
      //           Get.back();
      //         },
      //         child: Text("Aceptar"))
      //   ],
      // ));
    }
  }
}
