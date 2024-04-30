import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/signin_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';
import 'package:movie_app_final/widgets/Base/custom_carousel_signin_signup.dart';
import 'package:movie_app_final/widgets/Base/custom_item_radio.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';

class SignIn_SignUp_Screens extends StatefulWidget {
  const SignIn_SignUp_Screens({Key? key}) : super(key: key);
  static const routeName = 'SignIn_SignUp';

  @override
  State<SignIn_SignUp_Screens> createState() => _SignInSignUpScreensState();
}

class _SignInSignUpScreensState extends State<SignIn_SignUp_Screens> {
  List<ItemRadio> listItemCustom = [
    ItemRadio(isSelected: true, text: "English"),
    ItemRadio(isSelected: false, text: "Vietnamese"),
  ];

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomBottomSheet(
          title: 'Choose a language',
          subTitle: 'Which language do you want to use?',
          textButton: "Use it",
          onButtonPressed: () {},
          widget: CustomItemRadio(groupRadio: listItemCustom),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'MB',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      TextSpan(
                        text: 'oO',
                        style: TextStyle(
                            color: AppColors.Border_Radio, fontSize: 25),
                      ),
                      TextSpan(
                        text: 'king',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showBottomSheet();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.BaseColorWhite,
                    backgroundColor: AppColors.BaseColorBlackGround,
                    side: const BorderSide(color: AppColors.BaseColorWhite),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.language, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'English',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const carousel_signin_signup(),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'MBooking hello!',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enjoy your favorite movies',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            CustomTextButton(
                text: 'Sign in',
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreens.routeName,
                      arguments: "Sign In");
                }),
            SizedBox(height: 10),
            CustomTextButton(
              text: 'Sign up',
              onPressed: () {
                data.IsSign = false;
                Navigator.pushNamed(context, SignInScreens.routeName,
                    arguments: "Sign Up");
              },
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                'By sign in or sign up, you agree to our Terms of Service and Privacy Policy',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
