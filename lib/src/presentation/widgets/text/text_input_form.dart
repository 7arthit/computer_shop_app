import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class TextInputForm extends StatelessWidget {
  const TextInputForm({
    Key? key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.icon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.suffixText,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.obscureText = false,
    this.maxLength,
    this.showCursor = true,
    this.readOnly = false,
    this.style = const TextStyle(fontSize: 24, color: Colors.black),
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.fillColor = Colors.white,
    this.contentPadding = const EdgeInsets.all(8),
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.borderRadius = 10,
    this.obscuringCharacter = '•',
    this.border,
  }) : super(key: key);

  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final String? suffixText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool obscureText;
  final void Function()? onTap;
  final bool showCursor;
  final bool readOnly;

  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;

  final TextAlign textAlign;
  final bool enabled;

  final double borderRadius;

  final String obscuringCharacter;

  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: style,
      controller: controller,
      decoration: InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // border: InputBorder.none,
        counterText: '',
        filled: true,
        contentPadding: contentPadding,
        fillColor: fillColor,
        prefixIcon: icon,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle,
        errorText: errorText,
        errorStyle: errorStyle,
        hintStyle: hintStyle,
        focusedBorder: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide:
              const BorderSide(color: Colors.white, width: 1.0),
            ),
        enabledBorder: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide:
              const BorderSide(color: Colors.white, width: 1.0),
            ),
        errorBorder: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppTheme.red),
            ),
        focusedErrorBorder: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppTheme.red),
            ),
      ),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      onTap: onTap,
      showCursor: showCursor,
      readOnly: readOnly,
      maxLength: maxLength,
      focusNode: focusNode,
      textAlign: textAlign,
      enabled: enabled,
    );
  }
}
