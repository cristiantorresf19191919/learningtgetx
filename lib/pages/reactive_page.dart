import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/reactive_controller.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
        init: ReactiveController(),
        builder: (_) {
          print("Reactive");
          return Scaffold(
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Obx(() => Text("age ${_.myPet.value.age}")),
              TextButton(
                  onPressed: () => _.setPetAge(_.myPet.age + 1),
                  child: const Text("set age"))
            ]),
            // body: Obx(() => ListView(
            //     children: _.mapItems.values
            //         .map((e) => ListTile(
            //               title: Text(e),
            //               trailing: IconButton(
            //                   onPressed: () => _.deleteMapItem(e),
            //                   icon: const Icon(Icons.delete)),
            //             ))
            //         .toList())),
            // floatingActionButton: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     FloatingActionButton(
            //       heroTag: 'add',
            //       child: const Icon(Icons.add),
            //       onPressed: () {
            //         _.addMapItem();
            //       },
            //     ),
            //     FloatingActionButton(
            //       heroTag: 'date',
            //       child: const Icon(Icons.calendar_today),
            //       onPressed: () => _.addItem(),
            //     )
            //   ],
            // ),
          );
        });
  }
}
