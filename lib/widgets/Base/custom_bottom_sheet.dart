import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';

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
    final data = Provider.of<ManagerAllWidget>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.BaseColorBlackGround,
      height: MediaQuery.of(context).size.height * 0.45,
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
                ? Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      subTitle!,
                      style: const TextStyle(
                          fontSize: Dimens.FontSizeBottomSheetSubTitle,
                          color: AppColors.BaseColorWhite),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(child: widget),
          ),
          CustomTextButton(
            onPressed: () {
              data.SaveStartMode();
              //onButtonPressed;
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
