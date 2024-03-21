import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class EnterUserNameScreens extends StatefulWidget {
  const EnterUserNameScreens({Key? key}) : super(key: key);
  static const routeName = '/enter_username';

  @override
  State<EnterUserNameScreens> createState() => _EnterUserNameScreensState();
}

class _EnterUserNameScreensState extends State<EnterUserNameScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      appBar: AppBar(
        backgroundColor: AppColors.BaseColorBlackGround,
        elevation: 0, // Remove elevation
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.BaseColorWhite),
          onPressed: () {
            //Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Username',
                style: TextStyle(
                  color: AppColors.BaseColorTextMain,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    'Latin characters, no emoji/symbols',
                    style: TextStyle(
                      color: AppColors.BaseColorWhite,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), 
              // Khoảng cách giữa "Username" và TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(color: AppColors.BaseColorWhite),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                 filled: true,
                  fillColor: AppColors.BaseColorBlackGround,
                ),
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
              Divider(
                thickness: 0.5,
                color: AppColors.BaseColorWhite,
              ),
              SizedBox(height: 470,),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(500, 50)),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.BaseColorMain),
                ),
                child:  const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.BaseColorBlackGround,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
