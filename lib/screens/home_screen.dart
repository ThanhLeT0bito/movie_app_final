import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/actor_providers.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';
import 'package:movie_app_final/widgets/Base/custom_item_radio.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';

import '../widgets/Base/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //init all data movie from server
    // Provider.of<Movieproviders>(context, listen: false).fetchAllMovies();
    Provider.of<Movieproviders>(context, listen: false).InitListCarousel();
    Provider.of<ActorProviders>(context, listen: false).fetchActors();
    Provider.of<AuthProvider>(context, listen: false).fetchUsers();
    Provider.of<AuthProvider>(context, listen: false).getCurrentUser();

    //Provider.of<AuthProvider>(context, listen: false).TestFirebase();
    //Provider.of<OrdersProvider>(context, listen: false).fetchAllOrder();
    //Provider.of<OrdersProvider>(context, listen: false).fetchListOrderOfUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ManagerAllWidget>(context);

    var _screens = data.bottomnavigations;
    var bottomItems = data.bottomNavBarItems;
    var startIndexScreen = data.selectedIndex;
    var CustomBottomnavi = data.CustomBottomnavi;

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: _screens[startIndexScreen],
      bottomNavigationBar: CustomBottomnavi,
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
