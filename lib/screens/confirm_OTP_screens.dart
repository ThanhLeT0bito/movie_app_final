import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

import '../utils/wrapper.dart';

class ConfirmOTPScreens extends StatefulWidget {
  //final String vid;
  const ConfirmOTPScreens({
    Key? key,
    //required this.vid
  }) : super(key: key);
  static const routeName = 'confirm_OTP';

  @override
  State<ConfirmOTPScreens> createState() => _ConfirmOTPScreensState();
}

class _ConfirmOTPScreensState extends State<ConfirmOTPScreens> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  late List<bool> isFilled;
  late FocusNode firstTextFieldFocusNode;
  int remainingTimeInSeconds = 60;
  late Timer _timer;
  late TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (index) => TextEditingController());
    focusNodes = List.generate(6, (index) => FocusNode());
    isFilled = List.generate(6, (index) => false);
    startTimer();

    for (int i = 0; i < 6; i++) {
      controllers[i].addListener(() {
        if (controllers[i].text.length == 1) {
          setState(() {
            isFilled[i] = true;
          });
          if (i < 5) {
            FocusScope.of(context).requestFocus(focusNodes[i + 1]);
          } else {
            setState(() {
              isFilled[5] = false;
            });
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer before disposing state
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose(); // Call super.dispose() to properly dispose of resources
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTimeInSeconds > 0) {
          remainingTimeInSeconds--;
        } else {
          _timer.cancel(); // Hủy timer khi đếm ngược kết thúc
        }
      });
    });
  }

  void handleBackspace(int index) {
    if (index > 0 && controllers[index].text.isEmpty) {
      setState(() {
        // controllers[index - 1].text = ''; // Xóa ký tự ở ô trước đó
        isFilled[index - 1] = false; // Cập nhật trạng thái
      });
      FocusScope.of(context)
          .requestFocus(focusNodes[index - 1]); // Di chuyển focus về ô trước đó
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CustomAppBar(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confirm OTP code',
                        style: TextStyle(
                          color: AppColors.BaseColorTextMain,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'You just need to enter the OTP sent to the registered phone number ${"vid"}',
                              style: TextStyle(
                                color: AppColors.BaseColorWhite,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < 6; i++)
                            SizedBox(
                              width: 60,
                              height: 80,
                              child: TextField(
                                controller: controllers[i],
                                focusNode: focusNodes[i],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColors.BaseColorWhite,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  counterText: "",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: isFilled[i]
                                          ? AppColors.BaseColorMain
                                          : Colors
                                              .white, // Sử dụng màu đỏ khi chưa nhập
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.BaseColorMain,
                                    ),
                                  ),
                                ),
                                maxLength: 1,
                                onChanged: (value) {
                                  if (value.isNotEmpty && i < 5) {
                                    FocusScope.of(context)
                                        .requestFocus(focusNodes[i + 1]);
                                    setState(() {
                                      isFilled[i] =
                                          true; // Cập nhật trạng thái đã nhập
                                    });
                                  } else {
                                    handleBackspace(i);
                                    setState(() {
                                      isFilled[i] =
                                          false; // Cập nhật trạng thái đã nhập
                                    });
                                  }
                                },
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '00: ${remainingTimeInSeconds > 9 ? remainingTimeInSeconds : '0$remainingTimeInSeconds'}',
                            style: const TextStyle(
                              color: AppColors.BaseColorWhite,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                          text: "Continue",
                          onPressed: () {
                            //signIn();
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class OtpPage extends StatefulWidget {
//   final String vid;

//   const OtpPage({super.key, required this.vid});

//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   var code = '';

//   void signIn() async {
//     PhoneAuthCredential credential =
//         PhoneAuthProvider.credential(verificationId: widget.vid, smsCode: code);
//     try {
//       await FirebaseAuth.instance
//           .signInWithCredential(credential)
//           .then((value) {
//         Get.offAll(const Wrapper());
//       });
//     } on FirebaseAuthException catch (e) {
//       Get.snackbar("Error", e.code);
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: ConfirmOTPScreens());
//   }
//}