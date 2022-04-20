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
            body: Obx(() => ListView.builder(
                itemCount: _.items.length,
                itemBuilder: (__, index) {
                  final String text = _.items[index];
                  return ListTile(
                    title: Text(text),
                    trailing: IconButton(
                        onPressed: () => _.removeItem(index),
                        icon: const Icon(Icons.delete)),
                  );
                })),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'add',
                  child: const Icon(Icons.add),
                  onPressed: () {
                    _.increment();
                  },
                ),
                FloatingActionButton(
                  heroTag: 'date',
                  child: const Icon(Icons.calendar_today),
                  onPressed: () => _.addItem(),
                )
              ],
            ),
          );
        });
  }
}
