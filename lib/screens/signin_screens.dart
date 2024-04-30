import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/confirm_OTP_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_popup.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';

//import '../widgets/Base/Otp.dart';

class SignInScreens extends StatefulWidget {
  const SignInScreens({super.key});
  static const routeName = 'Sign_in';
  @override
  State<SignInScreens> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreens> {
  final TextEditingController phoneNumber = TextEditingController();

  Country selectCountry = Country(
      phoneCode: "+84",
      countryCode: "VN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "VietNam",
      example: "VietNam",
      displayName: "VietNam",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
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
                  Row(children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phoneNumber,
                            onChanged: (value) {
                              setState(() {
                                phoneNumber.text = value;
                              });
                            },
                            style: const TextStyle(
                                color: AppColors.BaseColorWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: "Enter phone number",
                              hintStyle: const TextStyle(
                                  color: AppColors.BaseColorWhite),
                              prefixIcon: Container(
                                padding: const EdgeInsets.only(
                                    top: 13, right: 20, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                        context: context,
                                        countryListTheme:
                                            const CountryListThemeData(
                                                bottomSheetHeight: 550),
                                        onSelect: (value) {
                                          setState(() {
                                            selectCountry = value;
                                          });
                                        });
                                  },
                                  child: Text(
                                    "${selectCountry.flagEmoji} ${(selectCountry.phoneCode)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: AppColors.BaseColorWhite,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
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
                  ]),
                  //const SizedBox(height: 200),
                  CustomTextButton(
                    text: 'Continue',
                    onPressed: () async {
                      //sendCode();
                      var check = await data.checkSignIn(phoneNumber.text);
                      if (!check && data.IsSign) {
                        CustomDialogHelper.showCustomDialog(
                            context, "Don't Have Account!", 'user-add.svg');
                        return;
                      }

                      if (check && !data.IsSign) {
                        CustomDialogHelper.showCustomDialog(
                            context, "Exists Number Phone!", 'phone-exist.svg');
                        return;
                      }
                      data.requestOTP(phoneNumber.text); //để send otp
                      data.currentPhone = phoneNumber.text;
                      print('CHECK CURRENT PHONE');
                      print(data.currentPhone);
                      //data.setSharePreferenceUserId(phoneNumber.text);
                      print(phoneNumber.text);
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
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
  // sendCode() async {
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //         phoneNumber: phoneNumber.text,
  //         verificationCompleted: (PhoneAuthCredential credential) {},
  //         verificationFailed: (FirebaseAuthException e) {
  //           Get.snackbar("Error", e.code);
  //         },
  //         codeSent: (String vid, int? token) {
  //           Get.to(
  //             OtpPage(
  //               vid: vid,
  //             ),
  //           );
  //         },
  //         codeAutoRetrievalTimeout: (vid) {});
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar("Error", e.code);
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }
}
