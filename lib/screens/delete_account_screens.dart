import 'package:flutter/material.dart';
import '../resources/app_color.dart';
import '../resources/dimens.dart';
import '../widgets/Base/custom_app_bar.dart';

class DeleteAccountScreens extends StatefulWidget {
  const DeleteAccountScreens({Key? key}) : super(key: key);
  static const routeName = '/delete-account-screens';

  @override
  State<DeleteAccountScreens> createState() => _DeleteAccountScreensState();
}

class _DeleteAccountScreensState extends State<DeleteAccountScreens> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> numberedTexts = [
      _buildNumberedText(
          'You will be logged out of your account on all devices', 1),
      SizedBox(height: 30),
      _buildNumberedText(
          'We will delete your personal information including: '
          'phone number, Name, Email from the application platform '
          'within 14 days, except information related to payment and '
          'financial control according to the provisions of law.',
          2),
      SizedBox(height: 30),
      _buildNumberedText(
          'We will delete any tickets you booked for '
          'upcoming shows that will no longer be valid',
          3),
    ];

    return Container(
      color: AppColors.BaseColorBlackGround,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(
              title: "Delete account",
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Dimens.SizedBoxWidthProfile,
                    ),
                    Text('You are deleting your account:',
                        style: TextStyle(
                            fontSize: Dimens.fontsizetext,
                            color: AppColors.BaseColorWhite)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.BaseColorWhite,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Dimens.SizedBoxWidthProfile,
                    ),
                    Text('Angelina',
                        style: TextStyle(
                            fontSize: 30, color: AppColors.BaseColorWhite)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Dimens.SizedBoxWidthProfile,
                    ),
                    Text('When deleting an account',
                        style: TextStyle(
                            fontSize: Dimens.fontsizetext,
                            color: AppColors.BaseColorWhite)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: numberedTexts.map((textWidget) {
                return Container(
                  child: textWidget,
                );
              }).toList(),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.white,
                thickness: Dimens.thickness + 1,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20), // Điều chỉnh padding theo ý muốn của bạn
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        activeColor: AppColors.BaseColorMain,
                        checkColor: AppColors.BaseColorBlack,
                        side: BorderSide(
                            color: AppColors.BaseColorMain, width: 2),
                      ),
                      Flexible(
                        child: Text(
                          'I confirm that I have read and understand the issues involved when deleting my account is permanent and cannot be refunded.',
                          style: TextStyle(
                            color: AppColors.BaseColorWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Khoảng cách giữa hai dòng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Xử lý khi nút Cancel được nhấn
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.BaseColorBlack,
                            side: BorderSide(
                                color: AppColors.BaseColorMain, width: 2),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: AppColors.BaseColorWhite,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Khoảng trống giữa hai nút
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Xử lý khi nút Delete account được nhấn
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors
                                .BaseColorMain, // Màu nền của nút Delete Account
                          ),
                          child: Text(
                            'Delete account',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.BaseColorBlack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'By sign in or sign up, you agree to our Terms of Service and Privacy Policy',
                style: TextStyle(color: AppColors.BaseColorGrey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedText(String text, int number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.BaseColorMain, // Màu cam
              borderRadius: BorderRadius.circular(15), // Bo tròn
            ),
            child: Text(
              number.toString(),
              style: TextStyle(
                color: AppColors.BaseColorBlack,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: Dimens.fontsizetext,
                color: AppColors.BaseColorWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
