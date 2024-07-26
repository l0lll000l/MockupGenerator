import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  static ColorController get instance => Get.find();

  /// variables
  Rx<Color> pickColor = Colors.white.obs;
  final textController = TextEditingController(text: '#2F19DB');

  /// functions
  colorpicker(
    context,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          content: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ColorPicker(
                    pickerColor: pickColor.value,
                    onColorChanged: (value) {
                      pickColor.value = value;
                    },
                    colorPickerWidth: 200,
                    pickerAreaHeightPercent: 0.7,
                    enableAlpha:
                        true, // hexInputController will respect it too.
                    displayThumbColor: true,
                    paletteType: PaletteType.hsvWithHue,
                    labelTypes: const [],
                    pickerAreaBorderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                    ),
                    hexInputController: textController, // <- here
                    portraitOnly: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: CupertinoTextField(
                  controller: textController,
                  prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.tag)),
                  suffix: IconButton(
                    icon: const Icon(Icons.content_paste_rounded),
                    onPressed: () => copyToClipboard(textController.text),
                  ),
                  autofocus: true,
                  maxLength: 9,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                    FilteringTextInputFormatter.allow(RegExp(kValidHexPattern)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void copyToClipboard(String input) {
    String textToCopy = input.replaceFirst('#', '').toUpperCase();
    if (textToCopy.startsWith('FF') && textToCopy.length == 8) {
      textToCopy = textToCopy.replaceFirst('FF', '');
    }
    Clipboard.setData(ClipboardData(text: '#$textToCopy'));
  }
}
