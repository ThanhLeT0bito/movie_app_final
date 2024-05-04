import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/signin_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';
import 'package:movie_app_final/widgets/Base/custom_carousel_signin_signup.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:movie_app_final/widgets/Base/item_bottom_sheet_base.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../providers/home_refactor_provider.dart';
import '../providers/language_provider.dart';
import '../widgets/item_radio.dart';

class SignIn_SignUp_Screens extends StatefulWidget {
  const SignIn_SignUp_Screens({Key? key}) : super(key: key);
  static const routeName = 'SignIn_SignUp';

  @override
  State<SignIn_SignUp_Screens> createState() => _SignInSignUpScreensState();
}

class _SignInSignUpScreensState extends State<SignIn_SignUp_Screens> {
  int indexSelect = 0;

  void showBottomSheet(HomeRefactorProvider listProvider,
      LanguageProvider languageProvider, List<ItemRadio> list) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ItemBottomSheetBase(
          title: S.current.choose_a_language,
          subTitle: S.current.which_language,
          textButton: S.current.use_it,
          onButtonPressed: () {
            languageProvider.changeLanguage(list[indexSelect]);
            Navigator.pop(context);
          },
          widget: ItemRadioWiget(
            groupRadio: list,
            onPressed: (int index) {
              indexSelect = index;
              listProvider.updateSelectedItem(indexSelect, true, context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AuthProvider>(context);
    final HomeRefactorProvider listProvider =
        Provider.of<HomeRefactorProvider>(context);
    final LanguageProvider languageProvider =
        Provider.of<LanguageProvider>(context);
    final List<ItemRadio> list = listProvider.list;
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
                    showBottomSheet(listProvider, languageProvider, list);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.BaseColorWhite,
                    backgroundColor: AppColors.BaseColorBlackGround,
                    side: const BorderSide(color: AppColors.BaseColorWhite),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.language, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        languageProvider.language == 'EN'
                            ? S.current.English
                            : S.current.VietNamese,
                        style: const TextStyle(color: Colors.white),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.current.mbooking,
                    style: const TextStyle(color: Colors.white, fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.current.enjoy_your,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            CustomTextButton(
                text: S.current.sign_in,
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreens.routeName,
                      arguments: S.current.sign_in);
                }),
            const SizedBox(height: 10),
            CustomTextButton(
              text: S.current.sign_up,
              onPressed: () {
                data.IsSign = false;
                Navigator.pushNamed(context, SignInScreens.routeName,
                    arguments: S.current.sign_up);
              },
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                S.current.by_sign_in,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
