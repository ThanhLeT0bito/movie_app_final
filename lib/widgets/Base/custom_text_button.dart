import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle style;

  CustomTextButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.BaseColorMain,
    this.textColor = AppColors.BaseColorBlackGround,
    this.borderRadius = Dimens.RadiusButton,
    this.style = const TextStyle(fontSize: Dimens.fontSizeTextButton),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimens.MarginButton),
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.PaddingButton),
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
