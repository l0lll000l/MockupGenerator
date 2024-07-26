import 'package:flutter/material.dart';

class XDropdownButton extends StatelessWidget {
  const XDropdownButton({
    super.key,
    this.devices = const [],
    this.onchanged,
    required this.labelText,
    this.onTap,
  });
  final String labelText;
  final List devices;
  final void Function(Object?)? onchanged;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onTap: onTap,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.smartphone_outlined),
          // hintText: 'Select Color',
          labelText: labelText,
          border: OutlineInputBorder()),
      items: devices.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e.toString()),
        );
      }).toList(),
      onChanged: onchanged,
    );
  }
}
