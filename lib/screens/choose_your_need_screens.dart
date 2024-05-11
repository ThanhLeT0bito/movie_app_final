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

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ManagerAllWidget>(context);

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100), // Fix padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 150,
                child: Container(
                  color: AppColors.BaseColorMain,
                  child: IconButton(
                    icon: Icon(Iconsax.ticket),
                    color: AppColors.BaseColorBlackGround,
                    iconSize: 100,
                    onPressed: () {
                      // Xử lý khi biểu tượng được nhấn
                      data.changeStartModeTemp(0);
                      data.SaveStartMode();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Booking ticket',
                style: TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 150),
              SizedBox(
                width: 300,
                height: 150,
                child: Container(
                  color: AppColors.BaseColorMain,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: AppColors.BaseColorBlackGround,
                    iconSize: 100,
                    onPressed: () {
                      // Xử lý khi biểu tượng được nhấn
                      data.changeStartModeTemp(1);
                      data.SaveStartMode();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Watching movie',
                style: TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
