import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget widget;
  final String textButton;
  final VoidCallback onButtonPressed;

  const CustomBottomSheet({
    Key? key,
    required this.title,
    this.subTitle,
    required this.widget,
    required this.textButton,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.BaseColorBlackGround,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: screenWidth / 3,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.BaseColorMain,
            ),
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  color: AppColors.BaseColorWhite,
                  fontSize: Dimens.FontSizeBottomSheetTitle,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: subTitle != null
                ? Text(
                    subTitle!,
                    style: const TextStyle(
                        fontSize: Dimens.FontSizeBottomSheetSubTitle,
                        color: AppColors.BaseColorWhite),
                  )
                : null,
          ),
          Expanded(
            child: SingleChildScrollView(child: widget),
          ),
          CustomTextButton(
            onPressed: () {
              onButtonPressed;
              Navigator.of(context).pop();
            },
            text: textButton,
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
