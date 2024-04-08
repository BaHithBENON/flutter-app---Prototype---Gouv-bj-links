import 'package:flutter/material.dart';

import '../../utilities/configs/color_config.dart';

class PrototypeItemWidget extends StatelessWidget {
  const PrototypeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorConfig.getInputColor(context),
      ),
    );
  }
}