import 'package:flutter/material.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

import '../resources/app_color.dart';
import '../resources/dimens.dart';
import '../widgets/Base/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 20),
            //no title
            const CustomAppBar(),
            // have title
            const CustomAppBar(title: 'Sign up'),
            // have icon right
            const CustomAppBar(
                title: 'Wellcome back',
                iconRightButton: Icons.access_time_sharp),
            const SizedBox(height: 30),
            //custom textfield
            CustomTextField(
              icon: Icons.phone,
              hintText: '(+84) 904-962-412',
              controller: controller,
              isNumber: true,
            ),
            CustomTextField(hintText: 'Le Tien thanh', controller: controller),
            //custom text button
            CustomTextButton(
              text: "Continue",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
