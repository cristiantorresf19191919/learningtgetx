import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_demo/controllers/global_controller.dart';
import 'package:getx_demo/controllers/socket_client_controller.dart';
import 'package:getx_demo/pages/home_page.dart';
import 'package:getx_demo/pages/reactive_page.dart';
import 'package:getx_demo/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(SocketClientController());
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ReactivePage());
  }
}
