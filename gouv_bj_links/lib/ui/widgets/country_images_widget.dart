// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/configs/color_config.dart';
import '../../utilities/variables/images_sources.dart';

class CountryImagesWidget extends StatelessWidget {
  double? height;
  CountryImagesWidget({super.key, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorConfig.getInputColor(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: double.maxFinite,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(ImagesSources.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: double.maxFinite,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(ImagesSources.flag,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}