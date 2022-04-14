import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        dispose: (_) {
          print("dispose on splash page");
        },
        init: SplashController(),
        builder: (_) => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
