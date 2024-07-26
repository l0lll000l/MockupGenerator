import 'package:flutter/material.dart';
import 'package:mobile_mockup_generator/Utils/loaders/shimmer.dart';

import '../constants/sizes.dart';

class IboxesShimmer extends StatelessWidget {
  const IboxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: XShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: XShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: XShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
