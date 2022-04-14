import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/home_controller.dart';
import 'package:getx_demo/pages/home_page_widgets/home_label.dart';
import 'package:getx_demo/pages/home_page_widgets/home_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        id: 'text',
        builder: (_) {
          print("build homepage inside builder 😊");
          return Scaffold(
            body: HomeList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _.increment();
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
