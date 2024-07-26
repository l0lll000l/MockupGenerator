import 'package:flutter/material.dart';
import 'package:mobile_mockup_generator/Utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class XShimmerEffect extends StatelessWidget {
  const XShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.color,
    this.radius = 15,
  });
  final double? width;
  final double? height;
  final Color? color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? (TColors.light),
        ),
      ),
    );
  }
}
