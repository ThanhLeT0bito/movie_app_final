import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'dart:math' as math;

import '../resources/dimens.dart';
import '../widgets/Base/custom_text_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-profile-screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Thêm các biến để lưu thông tin người dùng
  String? name;
  String? email;
  String? phoneNumber;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.BaseColorBlackGround,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppBar(
                  title: "My Ticket",
                  iconRightButton: Icons.edit,
                  onPressedBack: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
                SizedBox(height: 30),
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.camera_alt, size: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Widget để nhập tên
                buildTextField('Name', onChanged: (value) {
                  name = value;
                }),
                SizedBox(height: 20),
                // Widget để nhập email
                buildTextField('Email', onChanged: (value) {
                  email = value;
                }),
                SizedBox(height: 20),
                // Widget để nhập số điện thoại
                buildTextField('Phone Number', onChanged: (value) {
                  phoneNumber = value;
                }),
                SizedBox(height: 20),
                // Widget để nhập giới tính
                buildGenderDropdown(),
                SizedBox(height: 20),
                // Nút ""
                CustomTextButton(
                  text: 'Save',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xử lý lưu thông tin người dùng
  void saveProfile() {
    print('Name: $name');
    print('Email: $email');
    print('Phone Number: $phoneNumber');
    print('Gender: $gender');
  }

  // Widget để tạo các trường nhập liệu
  Widget buildTextField(String labelText, {void Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Widget để tạo dropdown cho giới tính
  Widget buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
        ),
        value: gender,
        onChanged: (newValue) {
          setState(() {
            gender = newValue;
          });
        },
        items: <String>['Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
