import 'package:flutter/material.dart';
import 'package:mobile_mockup_generator/Utils/constants/sizes.dart';

import 'shimmer.dart';

class XListTileShimmer extends StatelessWidget {
  const XListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            XShimmerEffect(width: 50, height: 50),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              children: [
                XShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems),
                XShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
