import 'package:flutter/material.dart';
import '../resources/app_color.dart';
import '../resources/dimens.dart';
import '../widgets/Base/custom_app_bar.dart';
import '../widgets/Base/custom_text_button.dart';
import 'home_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/change-password-screens';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String? newPassword;
  String? confirmPassword;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: "Change password",
            ),
            SizedBox(height: 30),
            // New Password
            Stack(
              children: [
                buildTextField('New password', onChanged: (value) {
                  newPassword = value;
                }),
                Positioned(
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(
                      obscureNewPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureNewPassword = !obscureNewPassword;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Confirm Password
            Stack(
              children: [
                buildTextField('Confirm password', onChanged: (value) {
                  confirmPassword = value;
                }),
                Positioned(
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            // Change button
            CustomTextButton(
              text: 'Change',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, {void Function(String)? onChanged}) {
    return TextField(
      onChanged: onChanged,
      obscureText: labelText == 'New password'
          ? obscureNewPassword
          : obscureConfirmPassword,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
