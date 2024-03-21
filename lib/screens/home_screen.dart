import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:movie_app_final/screens/movie_details.dart';
import 'package:movie_app_final/screens/profile_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_navigator.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';
import 'package:movie_app_final/widgets/Base/custom_item_radio.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:movie_app_final/widgets/custom_item_bottom__bar.dart';

import '../widgets/Base/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  late List<CustomItemBottomBar> bottomNavBarItems;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    /// screen main /// m muốn xexescreen nào?
    _screens = [
      HomepageScreens(),
      MoviedetailsScreens(),
      HomeWatching(),
      HomeProfileScreens(),
    ];

    ///Item bottom navigation
    bottomNavBarItems = [
      CustomItemBottomBar(
        icon: Iconsax.home_15,
        label: "Home",
        isSelected: _selectedIndex == 0,
      ),
      CustomItemBottomBar(
        icon: Iconsax.ticket,
        label: "Ticket",
        isSelected: _selectedIndex == 1,
      ),
      CustomItemBottomBar(
        icon: Iconsax.video4,
        label: "Movie",
        isSelected: _selectedIndex == 2,
      ),
      CustomItemBottomBar(
        icon: Iconsax.profile_circle,
        label: "Profile",
        isSelected: _selectedIndex == 2,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      for (int i = 0; i < bottomNavBarItems.length; i++) {
        bottomNavBarItems[i] = CustomItemBottomBar(
          icon: bottomNavBarItems[i].icon,
          label: bottomNavBarItems[i].label,
          isSelected: i == index,
        );
      }
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        bottomNavBarItems: bottomNavBarItems,
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

class DemoBase extends StatelessWidget {
  const DemoBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ItemRadio> listItemCustom = [
      ItemRadio(isSelected: true, text: "English"),
      ItemRadio(isSelected: false, text: "VietNamese"),
    ];

    void showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return CustomBottomSheet(
              title: 'Choose a language',
              subTitle: 'which language do u want to use?',
              textButton: "TextButton",
              onButtonPressed: () {},
              widget: CustomItemRadio(groupRadio: listItemCustom),
            );
          });
    }

    final TextEditingController controller;

    return Column(
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
                  controller: new TextEditingController(),
                  isNumber: true,
                ),
                CustomTextField(
                    hintText: 'Le Tien thanh',
                    controller: new TextEditingController()),
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
                  onPressed: () {
                    Navigator.pushNamed(context, HomeWatching.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
