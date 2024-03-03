import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';
import 'package:movie_app_final/widgets/Base/custom_item_radio.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

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
    List<CustomItemRadio> listItemCustom = [
      CustomItemRadio(text: 'English', isSelected: true),
      CustomItemRadio(text: 'Vietnamese', isSelected: false, onPressed: () {}),
    ];
    void setSelectedItem(CustomItemRadio customItemRadio) {
      setState(() {
        for (var item in listItemCustom) {
          if (item == customItemRadio) {
            item.isSelected = true;
          } else {
            item.isSelected = false;
          }
        }
      });
    }

    void showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return CustomBottomSheet(
              title: 'Choose a language',
              subTitle: 'which language do u want to use?',
              textButton: "TextButton",
              onButtonPressed: () {},
              widget: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: listItemCustom.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomItemRadio(
                          text: listItemCustom[index].text,
                          isSelected: listItemCustom[index].isSelected,
                          onPressed: () =>
                              setSelectedItem(listItemCustom[index]),
                        ),
                        const SizedBox(height: 20)
                      ],
                    );
                  },
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Column(
        children: [
          const SizedBox(height: 0),
          //no title
          const CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // have title
                  const CustomAppBar(title: 'Sign up'),
                  // have icon right
                  const CustomAppBar(
                      title: 'Wellcome Back Le Tien Thanh ',
                      iconRightButton: Icons.access_time_sharp),
                  const SizedBox(height: 30),
                  //custom textfield
                  CustomTextField(
                    icon: Icons.phone,
                    hintText: '(+84) 904-962-412',
                    controller: controller,
                    isNumber: true,
                  ),
                  CustomTextField(
                      hintText: 'Le Tien thanh', controller: controller),
                  CustomTextButton(
                    text: 'Login',
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      showBottomSheet();
                    },
                    text: "Show Bottom Sheet",
                  ),
                  //custom text button
                  CustomTextButton(
                    text: "Continue",
                    icon: Icons.accessibility_sharp,
                    onPressed: () {},
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
