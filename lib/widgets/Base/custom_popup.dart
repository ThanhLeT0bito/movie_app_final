import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class CustomDialog extends StatefulWidget {
  final String title;

  CustomDialog({
    required this.title,
  });

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 220,
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.BaseColorBlack,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.BaseColorMain, width: 0.5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.BaseColorWhite),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                      color: AppColors.BaseColorMain,
                    ))
              ],
            ),
            SvgPicture.asset(
              './assets/icons/warning-error.svg',
              width: 120,
              height: 150,
              color: AppColors.BaseColorAroundWhite,
            ),
            Expanded(
              child: Container(
                width: 190,
                child: const Center(
                  child: Text(
                    "please seleted another seat!",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.BaseColorWhite),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextButton(
                text: "Ok",
                heightbutton: 45,
                isMargin: false,
                borderRadius: 12,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}

class CustomDialogHelper {
  static void showCustomDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Sử dụng custom dialog widget
        return CustomDialog(
          title: title,
        );
      },
    );
  }
}