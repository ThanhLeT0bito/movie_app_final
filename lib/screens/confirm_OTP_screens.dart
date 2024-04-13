import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/enter_Username_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class ConfirmOTPScreens extends StatefulWidget {
  const ConfirmOTPScreens({Key? key}) : super(key: key);
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

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (index) => TextEditingController());
    focusNodes = List.generate(4, (index) => FocusNode());
    isFilled = List.generate(4, (index) => false);
    startTimer();

  for (int i = 0; i < 4; i++) {
  controllers[i].addListener(() {
    if (controllers[i].text.length == 1) {
      setState(() {
        isFilled[i] = true;
      });
      if (i < 3) {
        FocusScope.of(context).requestFocus(focusNodes[i + 1]);
      }
      else {
        setState(() {
          isFilled[3]=false;
        });
      }
    }
  });
  }
}

  @override
  void dispose() {
    _timer.cancel(); // Hủy timer trước khi dispose State
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
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
    FocusScope.of(context).requestFocus(focusNodes[index - 1]); // Di chuyển focus về ô trước đó
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
                              'You just need to enter the OTP sent to the registered phone number (704) 555-0127.',
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
                          for (int i = 0; i < 4; i++)
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
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.BaseColorMain,
                                    ),  
                                  ),
                                ),
                                maxLength: 1,
                                onChanged: (value) {
                                  if (value.isNotEmpty && i < 3) {
                                    FocusScope.of(context)
                                        .requestFocus(focusNodes[i + 1]);
                                    setState(() {
                                      isFilled[i] =true; // Cập nhật trạng thái đã nhập
                                    });
                                  } else {
                                    handleBackspace(i);
                                    setState(() {
                                      isFilled[i] =false; // Cập nhật trạng thái đã nhập
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
                  //const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                          text: "Continue",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, EnterUserNameScreens.routeName);
                          }),
                      SizedBox(
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