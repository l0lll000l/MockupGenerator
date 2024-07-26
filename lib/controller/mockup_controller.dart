import 'dart:io';
import 'dart:typed_data';

import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_mockup_generator/Utils/loaders/loaders.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class MockupController extends GetxController {
  static MockupController get instance => Get.find();
  final permissionGranted = false.obs;
  final Rx<File?> imageSelected = Rx<File?>(null);
  final platform = 'android'.obs;
  final deviceName = Devices.android.samsungGalaxyA50.obs;
  final devices = [].obs;

  @override
  void onInit() {
    super.onInit();
    getStoragePermission();
  }

  /// storage permision
  Future getStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      permissionGranted.value = true;
      print('Permission granted');
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
      print('Permission permanently denied');
    } else if (status.isDenied) {
      var result = await Permission.storage.request();
      if (result.isGranted) {
        permissionGranted.value = true;
        print('Permission granted');
      } else if (result.isPermanentlyDenied) {
        await openAppSettings();
        print('Permission permanently denied');
      } else {
        permissionGranted.value = false;
      }
    }
  }

  /// get Image
  Future<void> getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image!.path != null) {
        imageSelected.value = File(image.path);
        print(imageSelected.value!.path);
      }
      Tloaders.successSnackBar(
          title: 'Image Selected', message: 'Image selected successfully');
    } catch (e) {
      //   Tloaders.errorSnackBar(title: 'Oh Snap', message: 'Sonething went wrong');
    }
  }

  /// save image
  Future<void> captureAndSave(ScreenshotController screenshotController) async {
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        final directory = await getExternalStorageDirectory();
        final imagePath = '${directory!.path}/Mockup_${DateTime.now()}.png';

        final File imageFile = File(imagePath);
        await imageFile.writeAsBytes(image);

        // Save the image to the gallery
        GallerySaver.saveImage(imagePath).then((bool? success) {
          if (success != null && success) {
            Tloaders.successSnackBar(
                title: 'Success', message: 'Image saved to galery');
          } else {
            Tloaders.errorSnackBar(title: 'Error', message: 'Failed to save');
          }
        }).catchError((e) {
          Tloaders.errorSnackBar(title: 'Error', message: e.toString());
        });
      }
    }).catchError((e) {
      Tloaders.errorSnackBar(title: 'Error', message: e.toString());
    });
  }
}
