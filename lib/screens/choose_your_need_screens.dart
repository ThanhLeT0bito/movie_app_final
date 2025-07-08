import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:provider/provider.dart';

class ChooseNeed extends StatefulWidget {
  const ChooseNeed({Key? key}) : super(key: key);
  static const routeName = 'Choose_need';
  @override
  State<ChooseNeed> createState() => _ChooseNeedState();
}

class _ChooseNeedState extends State<ChooseNeed> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).fetchUsers();
    Provider.of<AuthProvider>(context, listen: false).getCurrentUser();
    Provider.of<ManagerAllWidget>(context, listen: false).setBottomItem(0);
    super.initState();
  }

  Widget _buildModeBox({
    required double width,
    required IconData icon,
    required VoidCallback onPressed,
    required String label,
  }) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: 150,
            child: Container(
              color: AppColors.BaseColorMain,
              child: IconButton(
                icon: Icon(icon),
                color: AppColors.BaseColorBlackGround,
                iconSize: 100,
                onPressed: onPressed,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.BaseColorWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ManagerAllWidget>(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double boxWidth = deviceWidth > 300 ? 300 : deviceWidth * 0.9;

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      appBar: AppBar(
        title: const Text(
          'Choose mode',
          style: TextStyle(
            fontSize: 25,
            color: AppColors.BaseColorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.BaseColorBlackGround,
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: isLandscape
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildModeBox(
                    width: boxWidth,
                    icon: Iconsax.ticket,
                    onPressed: () {
                      data.changeStartModeTemp(0);
                      data.SaveStartMode();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    label: 'Booking ticket',
                  ),
                  _buildModeBox(
                    width: boxWidth,
                    icon: Icons.play_arrow,
                    onPressed: () {
                      data.changeStartModeTemp(1);
                      data.SaveStartMode();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    label: 'Watching movie',
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildModeBox(
                    width: boxWidth,
                    icon: Iconsax.ticket,
                    onPressed: () {
                      data.changeStartModeTemp(0);
                      data.SaveStartMode();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    label: 'Booking ticket',
                  ),
                  _buildModeBox(
                    width: boxWidth,
                    icon: Icons.play_arrow,
                    onPressed: () {
                      data.changeStartModeTemp(1);
                      data.SaveStartMode();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    label: 'Watching movie',
                  ),
                ],
              ),
      ),
    );
  }
}
