import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final IconData? iconRightButton;
  final IconData? iconLeftButton;
  final VoidCallback? onPressedRight;
  final VoidCallback? onPressedBack;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    this.title,
    this.iconLeftButton,
    this.iconRightButton,
    this.onPressedRight,
    this.onPressedBack,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimens.MarginTopAppbar),
      //color: AppColors.BaseColorBlackGround,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //arrow back button
          showBackButton
              ? IconButton(
                  iconSize: Dimens.IconSizeAppBar,
                  onPressed: onPressedBack ??
                      () => {
                            Navigator.of(context).pop(),
                          },
                  icon: Icon(
                    iconLeftButton ?? Icons.arrow_back,
                    color: AppColors.BaseColorWhite,
                  ))
              : Container(
                  width: Dimens.FontSizeAppBar,
                ),
          Expanded(
            child: Center(
              child: title != null
                  ? Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      title!,
                      style: const TextStyle(
                          color: AppColors.BaseColorWhite,
                          fontSize: Dimens.FontSizeAppBar,
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
            ),
          ),
          iconRightButton != null
              ? IconButton(
                  onPressed: () => onPressedRight,
                  iconSize: Dimens.IconSizeAppBar,
                  icon: Icon(
                    iconRightButton,
                    color: AppColors.BaseColorWhite,
                  ))
              : Container(width: Dimens.IconSizeAppBar),
        ],
      ),
    );
  }
}
