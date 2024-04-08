// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/configs/text_config.dart';
import '../../utilities/variables/fonts_names.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  Widget? icon;
  Color? background;
  Color? textColor;
  Color? borderColor;
  Function? onTap;
  Gradient? gradient;
  TextAlign? textAlign;
  String ?font;
  int ?fontSize;

  ButtonWidget(
      {Key? key,
      required this.text,
      this.icon,
      this.background,
      this.borderColor,
      this.textColor,
      this.onTap,
      this.fontSize,
      this.gradient,
      this.font,
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: icon != null ? 10 : 10),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(5),
          border: borderColor != null
              ? Border(
                  top: BorderSide(width: 1.0, color: borderColor!),
                  left: BorderSide(width: 1.0, color: borderColor!),
                  right: BorderSide(width: 1.0, color: borderColor!),
                  bottom: BorderSide(width: 1.0, color: borderColor!),
                )
              : null,
          gradient: gradient,
        ),
        child: Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
            Text(
              text,
              textAlign: textAlign,
              style: TextConfig.getSimpleTextStyle(true,
              size: fontSize,
                  color: textColor, font: font ?? FontsNames.fontMono),
            ),
          ],
        ),
      ),
    );
  }
}
