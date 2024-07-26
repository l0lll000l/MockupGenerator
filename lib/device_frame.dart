import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_mockup_generator/Utils/constants/colors.dart';
import 'package:mobile_mockup_generator/Utils/constants/sizes.dart';
import 'package:mobile_mockup_generator/controller/colorcontroller.dart';
import 'package:mobile_mockup_generator/controller/mockup_controller.dart';

class XdeviceFrame extends StatelessWidget {
  const XdeviceFrame({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.applyImageRadius = false,
    this.border,
    this.padding,
    this.onPressed,
    this.backGroundColor = TColors.light,
    this.borderRadius = TSizes.md,
  });
  final double? width, height;
  final bool applyImageRadius;
  final Color backGroundColor;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final controller = MockupController.instance;
    final colorControler = ColorController.instance;
    return Obx(
      () => GestureDetector(
          onTap: onPressed,
          child: Container(
            height: height,
            width: width,
            padding: padding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: border,
                color: colorControler.pickColor.value),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  controller.getImage();
                },
                child: DeviceFrame(
                  device: controller.deviceName.value,
                  isFrameVisible: true,
                  orientation: Orientation.portrait,
                  screen: SizedBox(
                    child: controller.imageSelected.value != null
                        ? Image.file(controller.imageSelected.value!,
                            fit: BoxFit.cover)
                        : const Center(
                            child: Icon(
                              Iconsax.add_square5,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

//  CachedNetworkImage(
//                     fit: widget.fit,
//                     imageUrl: widget.imageurl,
//                     progressIndicatorBuilder: (context, url, progress) =>
//                         const XShimmerEffect(
//                           width: double.infinity,
//                           height: 190,
//                           radius: 15,
//                         ),
//                     errorWidget: (context, url, error) {
//                       print(error);
//                       return const Icon(Icons.error);
//                     })