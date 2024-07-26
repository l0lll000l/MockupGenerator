import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_mockup_generator/controller/mockup_controller.dart';

class XDropdownButton2 extends StatelessWidget {
  const XDropdownButton2({
    super.key,
    this.onchanged,
    required this.labelText,
    this.formkey,
  });
  final String labelText;
  final Key? formkey;
  final void Function(Object?)? onchanged;
  @override
  Widget build(BuildContext context) {
    try {
      return Obx(
        () {
          final controller = MockupController.instance;
          if (controller.devices.length < 1) {
            return Container();
          } else {
            return DropdownButtonFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.smartphone_outlined),
                  labelText: labelText,
                  border: const OutlineInputBorder()),
              items: controller.devices.map((e) {
                return DropdownMenuItem(
                  value: controller.devices.length > 0
                      ? e.keys.join().toString()
                      : '',
                  child: controller.devices.length > 0
                      ? Text(e.keys.join().toString())
                      : Text(''),
                );
              }).toList(),
              onChanged: (mobileName) {
                try {
                  if (mobileName != null && controller.devices.length > 0) {
                    final newname = controller.devices.firstWhere(
                        (value) => value.containsKey(mobileName.toString()));
                    controller.deviceName.value = newname.values.first;
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
            );
          }
        },
      );
    } catch (e) {
      print(e.toString());
      return Container();
    }
  }
}
