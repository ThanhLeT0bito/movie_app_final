import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';

class ChooseNeed extends StatefulWidget {
  const ChooseNeed({Key? key}) : super(key: key);
  static const routeName = 'Choose_need';
  @override
  State<ChooseNeed> createState() => _ChooseNeedState();
}

class _ChooseNeedState extends State<ChooseNeed> {
  @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.play_arrow),
                    color: AppColors.BaseColorBlackGround,
                    iconSize: 100,
                    onPressed: () {
                      // Xử lý khi biểu tượng được nhấn
                      Navigator.pushNamed(context, HomepageScreens.routeName);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('Watching movie',style: TextStyle(color: AppColors.BaseColorWhite,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 150),
              SizedBox(
                width: 300,
                height: 150,
                child: Container(
                  color: AppColors.BaseColorMain,
                  child: IconButton(
                    icon: Icon(Icons.airplane_ticket),
                    color: AppColors.BaseColorBlackGround,
                    iconSize: 100,
                    onPressed: () {
                      // Xử lý khi biểu tượng được nhấn
                      Navigator.pushNamed(context, HomeWatching.routeName);
                    },
                  ),
                ),
              ),
               SizedBox(height: 20,),
              Text('Booking ticket',style: TextStyle(color: AppColors.BaseColorWhite,fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
