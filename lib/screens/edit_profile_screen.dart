import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../providers/AuthProvider.dart';

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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void initData(AuthProvider data) {
    if (data.CurrentUser != null) {
      nameController.text = data.CurrentUser?.name ?? '';
      emailController.text = data.CurrentUser?.mail ?? '';
      phoneController.text = data.CurrentUser?.phone ?? '';
      //  genderController.text = data.CurrentUser?. ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
    initData(data);
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: SingleChildScrollView(
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
                const SizedBox(height: 30),
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
                      child: ClipOval(
                        child: _image != null
                            ? Image.file(
                                File(
                                    _image?.path ?? 'assets/images/avatar.jpg'),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : Image.file(
                                File(data.CurrentUser?.urlImage.toString() ??
                                    'assets/images/avatar.jpg'),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              getImage();
                              // setState(() {});
                            },
                            child: const Icon(Icons.camera_alt, size: 20)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Widget để nhập tên
                buildTextField('Name', nameController, onChanged: (value) {
                  name = value;
                }),
                const SizedBox(height: 20),
                // Widget để nhập email
                buildTextField('Email', emailController, onChanged: (value) {
                  email = value;
                }),
                const SizedBox(height: 20),
                // Widget để nhập số điện thoại
                buildTextField('Phone Number', phoneController,
                    onChanged: (value) {
                  phoneNumber = value;
                }),
                const SizedBox(height: 20),
                // Widget để nhập giới tính
                buildGenderDropdown(),
                const SizedBox(height: 20),
                // Nút ""
                CustomTextButton(
                  text: 'Save',
                  onPressed: () async {
                    await data.updateUser(data.currentUserId,
                        nameController.text, _image?.path ?? '');
                    Provider.of<AuthProvider>(context, listen: false)
                        .getCurrentUser();
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

  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image?.path ?? '');
    });
  }

  // Hàm xử lý lưu thông tin người dùng
  void saveProfile() {
    print('Name: $name');
    print('Email: $email');
    print('Phone Number: $phoneNumber');
    print('Gender: $gender');
  }

  String filePathToURL(String filePath) {
    if (Platform.isAndroid || Platform.isIOS) {
      return Uri.file(filePath).toString();
    }
    return filePath;
  }

  // Widget để tạo các trường nhập liệu
  Widget buildTextField(String labelText, TextEditingController controller,
      {void Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: const OutlineInputBorder(),
          )),
    );
  }

  // Widget để tạo dropdown cho giới tính
  Widget buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
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
