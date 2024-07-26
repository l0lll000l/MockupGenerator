import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_mockup_generator/Utils/constants/sizes.dart';
import 'package:mobile_mockup_generator/controller/colorcontroller.dart';
import 'package:mobile_mockup_generator/controller/mockup_controller.dart';
import 'package:mobile_mockup_generator/device_frame.dart';
import 'package:mobile_mockup_generator/features/drop_down.dart';
import 'package:mobile_mockup_generator/features/dropdown2.dart';
import 'package:mobile_mockup_generator/features/list.dart';
import 'package:mobile_mockup_generator/rounded_container.dart';
import 'package:screenshot/screenshot.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScreenshotController screenshotController = ScreenshotController();
  final controller = Get.put(MockupController());
  final colorController = Get.put(ColorController());

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      children: [
        Screenshot(
          controller: screenshotController,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
            child: XRoundedContainer(
                ontap: () {
                  colorController.colorpicker(context);
                },
                height: 500,
                child: const XdeviceFrame()),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              //// dropdown 1
              XDropdownButton(
                onTap: () {
                  controller.devices.value = [];
                },
                labelText: 'Select platform',
                devices: platform,
                onchanged: (value) {
                  controller.devices.value = [];
                  controller.platform.value = value as String;
                  controller.devices.value = devices[value.toString()];
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// dropdown 2

              const XDropdownButton2(
                // formkey: formKey,
                labelText: 'Select device',
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.captureAndSave(screenshotController);
                    },
                    child: const Text('Download')),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
