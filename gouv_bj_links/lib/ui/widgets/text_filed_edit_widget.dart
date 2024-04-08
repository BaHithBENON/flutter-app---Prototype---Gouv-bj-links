// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../utilities/configs/color_config.dart';
import '../../utilities/configs/text_config.dart';
import '../../utilities/variables/app_texts.dart';
import '../../utilities/variables/fonts_names.dart';

class TextFieldEditWidget extends StatefulWidget {
  String? title;
  String? hint;
  TextEditingController controller;
  TextInputType? keyboardType;
  int? minLines;
  int? maxLines;
  bool bold;
  Color? borderColor;
  Color? background;
  Color? textColor;
  Function? onChange;
  Function? onSave;
  Function? validator;
  String? obscureCharacter;
  bool? obscure;
  String? errorText;
  String? indicationText;
  bool tagError;
  Widget? leftIcon;
  bool withEraser;
  bool readOnly;
  bool withTitleWhenTexting;
  int? maxLength;

  TextFieldEditWidget({
    Key? key,
    this.title,
    this.hint,
    required this.controller,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.bold = false,
    this.borderColor,
    this.textColor,
    this.background,
    this.onChange,
    this.onSave,
    this.maxLength,
    this.validator,
    this.obscureCharacter = '•',
    this.obscure = false,
    this.errorText,
    this.indicationText,
    this.tagError = false,
    this.leftIcon,
    this.withEraser = true,
    this.readOnly = false,
    this.withTitleWhenTexting = true,
  }) : super(key: key);

  @override
  State<TextFieldEditWidget> createState() => _TextFieldEditWidgetState();
}

class _TextFieldEditWidgetState extends State<TextFieldEditWidget> {
  bool _isTexting = false;
  bool _hidden = false;
  final FocusNode _focusNode = FocusNode(
    canRequestFocus: false,
    descendantsAreFocusable: false,
  );

  @override
  void initState() {
    super.initState();
    _hidden = widget.obscure!;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isTexting = true;
        });
      } else {
        setState(() {
          _isTexting = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null && widget.title!.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(
            widget.title!,
            style:
                TextConfig.getSimpleTextStyle(true, font: FontsNames.fontMono),
          ),
          const SizedBox(height: 10),
        ],
        if (_isTexting &&
            widget.hint != null &&
            widget.hint!.isNotEmpty &&
            widget.withTitleWhenTexting) ...[
          Text(
            widget.hint!,
            style:
                TextConfig.getSimpleTextStyle(true, font: FontsNames.fontMono),
          ),
          const SizedBox(height: 10),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.background ?? ColorConfig.getInputColor(context),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      TextFormField(
                        controller: widget.controller,
                        keyboardType: widget.keyboardType ?? TextInputType.text,
                        style: TextConfig.getSimpleTextStyle(false, font: FontsNames.fontMono, color: widget.textColor),
                        minLines: widget.minLines,
                        maxLines: widget.maxLines,
                        readOnly: widget.readOnly,
                        maxLength: widget.maxLength,
                        cursorColor: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          border: InputBorder.none,
                          hintText: widget.hint,
                          hintStyle: TextConfig.getSimpleTextStyle(
                            widget.bold,
                            font: FontsNames.fontMono,
                            color: Colors.white,
                          ),
                          prefixIcon: widget.leftIcon,
                          suffix: widget.withEraser && _focusNode.hasFocus
                              ? !widget.obscure!
                                  ? InkWell(
                                      onTap: () {
                                        widget.controller.clear();
                                      },
                                      child: const Icon(Icons.close),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          _hidden = !_hidden;
                                        });
                                      },
                                      child: Text(
                                        _hidden
                                            ? AppTexts.toSee
                                            : AppTexts.toHide,
                                      ),
                                    )
                              : const SizedBox(),
                        ),
                        //focusNode: _focusNode,
                        obscureText: _hidden,
                        onTap: () {},
                        onChanged: (value) {
                          if (widget.onChange != null) widget.onChange!(value);
                        },
                        validator: (value) {
                          if (widget.validator != null) {
                            return widget.validator!(value);
                          } return null;
                        },
                        onEditingComplete: () {
                          _focusNode.unfocus();
                          if (widget.onSave != null) widget.onSave!();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.indicationText != null) ...[
          const SizedBox(height: 10),
          Text(
            widget.indicationText!,
            style: TextConfig.getSimpleTextStyle(true,
                font: FontsNames.fontMono, size: 10),
          ),
        ],
        if (widget.tagError && widget.errorText != null) ...[
          const SizedBox(height: 10),
          Text(
            widget.errorText!,
            style: TextConfig.getSimpleTextStyle(true,
                font: FontsNames.fontMono, size: 10, color: Colors.red),
          ),
        ]
      ],
    );
  }
}
