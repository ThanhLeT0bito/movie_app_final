import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:movie_app_final/widgets/Base/custom_textfield.dart';

class EnterUserNameScreens extends StatefulWidget {
  const EnterUserNameScreens({Key? key}) : super(key: key);
  static const routeName = '/enter_username';

  @override
  State<EnterUserNameScreens> createState() => _EnterUserNameScreensState();
}

class _EnterUserNameScreensState extends State<EnterUserNameScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: CustomAppBar(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter Username',
                    style: TextStyle(
                        color: AppColors.BaseColorTextMain,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Latin characters, no emoji/symbols',
                        style: TextStyle(
                          color: AppColors.BaseColorWhite,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Khoảng cách giữa "Username" và TextField
                  CustomTextField(
                      hintText: "Angelia",
                      controller: new TextEditingController()),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                            text: "Done",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, HomeScreen.routeName);
                            }),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
