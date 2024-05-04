import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/choose_your_need_screens.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_popup.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:movie_app_final/widgets/Base/custom_textfield.dart';
import 'package:provider/provider.dart';

class EnterUserNameScreens extends StatefulWidget {
  const EnterUserNameScreens({Key? key}) : super(key: key);
  static const routeName = '/enter_username';

  @override
  State<EnterUserNameScreens> createState() => _EnterUserNameScreensState();
}

class _EnterUserNameScreensState extends State<EnterUserNameScreens> {
  var userNameText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
    if (data.userName.isNotEmpty) {
      userNameText.text = data.userName;
    }
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
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
                  const SizedBox(height: 20),
                  // Khoảng cách giữa "Username" và TextField
                  CustomTextField(
                      hintText: "Angelia", controller: userNameText),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                            text: "Done",
                            onPressed: () async {
                              if (userNameText.text.isEmpty) {
                                return;
                              }
                              //check signIn GG
                              if (data.isGoogle) {
                                data.currentName = userNameText.text;
                                await data.addNewUser();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Đăng kí thành công'),
                                  duration: Duration(
                                      seconds: 3), // Thời gian hiển thị
                                ));
                                // Navigator.pop(context);
                                // Navigator.pushReplacementNamed(
                                //     context, SignInSignUpScreens.routeName);
                              } else {
                                data.currentName = userNameText.text;
                                print(data.currentName);

                                var check = await data.addNewUser();

                                if (!check) {
                                  CustomDialogHelper.showCustomDialog(context,
                                      "SignUp Error!", 'user-error.svg');
                                  return;
                                }
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              }
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
