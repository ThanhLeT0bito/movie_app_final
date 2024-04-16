import 'package:flutter/material.dart';
import '../resources/app_color.dart';
import '../resources/dimens.dart';
import '../widgets/Base/custom_app_bar.dart';
import 'home_screen.dart';

class ChangePasswordScreens extends StatefulWidget {
  const ChangePasswordScreens({Key? key}) : super(key: key);
  static const routeName = '/change-password-screens';

  @override
  State<ChangePasswordScreens> createState() => _ChangePasswordScreensState();
}

class _ChangePasswordScreensState extends State<ChangePasswordScreens> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppBar(
                  title: "Change password",
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Dimens.SizedBoxWidthProfile,
                        ),
                        Text('Which one do you want to send OTP?',
                            style: TextStyle(
                                fontSize: Dimens.fontsizetext,
                                color: AppColors.BaseColorWhite)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Dimens.SizedBoxWidthProfile,
                        ),
                        Text('Send to (+84) 472- 937-40',
                            style: TextStyle(
                                fontSize: Dimens.fontsizetext,
                                color: AppColors.BaseColorWhite)),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: Dimens.SizeIconArrow,
                        color: AppColors.BaseColorWhite),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: Dimens.thickness,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Dimens.SizedBoxWidthProfile,
                        ),
                        Text('Send to angelina@example.com',
                            style: TextStyle(
                                fontSize: Dimens.fontsizetext,
                                color: AppColors.BaseColorWhite)),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: Dimens.SizeIconArrow,
                        color: AppColors.BaseColorWhite),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
