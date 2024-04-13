import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/confirm_OTP_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:movie_app_final/widgets/Base/custom_textfield.dart';

class SignInScreens extends StatefulWidget {
  const SignInScreens({super.key});
  static const routeName = 'Sign_in';
  @override
  State<SignInScreens> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreens> {
  @override
  Widget build(BuildContext context) {
    final ModalRoute route = ModalRoute.of(context)!;
    final args = route.settings.arguments;

    String title = "Sign in";
    if (args != null) {
      title = args as String;
    }
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CustomAppBar(
              title: title,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomTextField(
                          icon: Icons.phone,
                          hintText: '(+84) 904-962-412',
                          controller: new TextEditingController(),
                          isNumber: true,
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Enter OTP code ?',
                              style: TextStyle(
                                color: AppColors.BaseColorWhite,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //const SizedBox(height: 200),
                  CustomTextButton(
                    text: 'Coutinue',
                    onPressed: () {
                      Navigator.pushNamed(context, ConfirmOTPScreens.routeName);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.BaseColorWhite,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: AppColors.BaseColorWhite),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.BaseColorWhite,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        text: "Facebook",
                        onPressed: () {},
                        icon: "assets/images/logo_fb.png",
                        backgroundColor: AppColors.BackgroundButtonFBAndGG,
                        textColor: AppColors.BaseColorWhite,
                      ),
                      const SizedBox(height: 20),
                      CustomTextButton(
                        text: "Google",
                        onPressed: () {},
                        icon: "assets/images/logo_gg.png",
                        backgroundColor: AppColors.BackgroundButtonFBAndGG,
                        textColor: AppColors.BaseColorWhite,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'By sign in or sign up, you agree to our Terms of Service and Privacy Policy',
                      style: TextStyle(color: AppColors.BaseColorWhite),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
