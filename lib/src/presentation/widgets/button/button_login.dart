import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/widgets/button/app_button.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_label.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    required this.text,
    this.onPressed,
    this.style,
    this.textColor,
    this.fontWeight,
    this.fontSize = 20,
    this.height,
    this.width,
    this.visible = true,
    this.child,
    this.icon,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final ButtonStyle? style;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final bool visible;
  final Widget? child;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox();
    }

    return SizedBox(
      height: height ?? 48,
      width: width,
      child: ElevatedButton(
        style: style ?? AppButton.loginButtonStyle,
        onPressed: onPressed,
        child: child ?? _textButton,
      ),
    );
  }

  Widget get _textButton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon ?? const SizedBox(),
        TextLabel(
          text: text,
          fontSize: fontSize,
          textAlign: TextAlign.center,
          color: textColor ?? Colors.red,
        ),
      ],
    );
  }
}
