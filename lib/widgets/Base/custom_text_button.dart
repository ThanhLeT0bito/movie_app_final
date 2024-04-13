import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final dynamic icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  late Color textColor;
  final double borderRadius;
  final TextStyle style;
  final double? heightbutton;
  final bool isMargin;

  CustomTextButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.BaseColorMain,
    this.textColor = AppColors.BaseColorBlackGround,
    this.borderRadius = Dimens.RadiusButton,
    this.style = const TextStyle(
        fontSize: Dimens.fontSizeTextButton, fontWeight: FontWeight.bold),
    this.heightbutton,
    this.isMargin = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    if (backgroundColor == AppColors.BaseColorTransparent) {
      if (textColor == AppColors.BaseColorBlackGround) {
        textColor = AppColors.BaseColorWhite;
      }
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: AppColors.BaseColorWhite),
      );
    }
    return Container(
      margin: EdgeInsets.all(isMargin! ? Dimens.MarginButton : 0),
      width: double.infinity,
      height: heightbutton,
      decoration: decoration,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon is IconData)
                Icon(icon as IconData,
                    size: Dimens.fontSizeIcon, color: textColor),
              if (icon is String)
                Image.asset(icon as String,
                    height: Dimens.fontSizeIcon, width: Dimens.fontSizeIcon),
              icon != null ? const SizedBox(width: 10) : const SizedBox(),
              Text(
                text,
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextButton2 extends StatelessWidget {
  final String text;
  final dynamic icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  late Color textColor;
  final double borderRadius;
  final TextStyle style;

  CustomTextButton2({
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.BaseColorBlackGround,
    this.textColor = AppColors.BaseColorWhite,
    this.borderRadius = Dimens.RadiusButton,
    this.style = const TextStyle(
        fontSize: Dimens.fontSizeTextButton, fontWeight: FontWeight.bold),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    if (backgroundColor == Colors.transparent) {
      if (textColor == AppColors.BaseColorBlackGround) {
        textColor = AppColors.BaseColorWhite;
      }
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: AppColors.BaseColorWhite),
      );
    }
    return Container(
      margin: const EdgeInsets.all(Dimens.MarginButton),
      width: double.infinity,
      decoration: decoration,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon is IconData)
                Icon(icon as IconData,
                    size: Dimens.fontSizeTextButton, color: textColor),
              if (icon is String)
                Image.asset(icon as String,
                    height: Dimens.fontSizeTextButton,
                    width: Dimens.fontSizeTextButton),
              icon != null ? const SizedBox(width: 10) : const SizedBox(),
              Text(
                text,
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
