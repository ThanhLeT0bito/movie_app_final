import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class SignInScreens extends StatefulWidget {
  const SignInScreens({super.key});
  static const routeName='Sign_in';
  @override
  State<SignInScreens> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign in',
          style: TextStyle(color: AppColors.BaseColorWhite),
        ),
        centerTitle: true,
        backgroundColor: AppColors.BaseColorBlackGround,
        iconTheme: const IconThemeData(color: AppColors.BaseColorWhite),
         leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: AppColors.BaseColorBlackGround,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: '(+84)',
                  hintStyle: TextStyle(color: AppColors.BaseColorWhite),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.BaseColorBlackGround,
                ),
                style: TextStyle(color: Colors.white),
              ),
              const Divider(
                color: AppColors.BaseColorWhite,
                thickness: 0.5,
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: AppColors.BaseColorWhite),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.BaseColorBlackGround,
                ),
                style: TextStyle(color: Colors.white),
              ),
              const Divider(
                color: AppColors.BaseColorWhite,
                thickness: 0.5,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Enter OTP code ?',
                  style: const TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
              const SizedBox(height: 200),
              
              CustomTextButton(text: 'Coutinue', onPressed: () {  },),
              const SizedBox(height: 30),
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
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    label: const Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.grey,
                      minimumSize: const Size(500, 60),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                    label: const Text(
                      'Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.grey,
                      minimumSize: const Size(500, 50),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Text(
                'By sign in or sign up, you agree to our Terms of Service and Privacy Policy',
                style: TextStyle(color: AppColors.BaseColorWhite),
                textAlign: TextAlign.center
              ),
            ],
          ),
        ),
      ),
    );
  }
}