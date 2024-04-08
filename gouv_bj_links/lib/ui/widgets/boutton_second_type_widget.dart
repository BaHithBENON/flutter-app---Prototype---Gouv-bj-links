// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/configs/text_config.dart';

class ButtonSecondTypeWidget extends StatelessWidget {
  Function onTap;
  Icon icon;
  String content;
  ButtonSecondTypeWidget({super.key, required this.onTap, required this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Expanded(
              child: Text(content,
                style: TextConfig.getSimpleTextStyle(true),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}