import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  static const routeName = '/home-profile-movie';

  @override
  State<HomeProfile> createState() => _ProfileState();
}

class _ProfileState extends State<HomeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black, // Màu nền đen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center, // Căn thẳng hàng các phần tử
                children: [
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // Màu nền của hình tròn
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/avatar.jpg'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Angelina', // Tên người dùng
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.email, color: AppColors.BaseColorWhite, size: 20),
                              SizedBox(width: 10),
                              Text(
                                'angelina@example.com',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, color: AppColors.BaseColorWhite, size: 20),
                              SizedBox(width: 10),
                              Text(
                                '0123456789',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white, size: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.tiktok, size: 24, color: AppColors.BaseColorWhite),
                          SizedBox(width: 10),
                          Text('My ticket', style: TextStyle(fontSize: 18, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5, 
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart, size: 24, color: AppColors.BaseColorWhite),
                          SizedBox(width: 10,),
                          Text('Payment history', style: TextStyle(fontSize: 18, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider( 
                    color: Colors.grey,
                    thickness: 0.1, 
                  ),
                  SizedBox(height: 20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.language, size: 24, color: AppColors.BaseColorWhite),
                          SizedBox(width: 10),
                          Text('Change language', style: TextStyle(fontSize: 18, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider( 
                    color: Colors.grey,
                    thickness: 0.1, 
                  ),
                  SizedBox(height: 20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.password_sharp, size: 24, color: AppColors.BaseColorWhite),
                          SizedBox(width: 10),
                          Text('Change password', style: TextStyle(fontSize: 18, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider( 
                    color: Colors.grey,
                    thickness: 0.1, 
                  ),
                  SizedBox(height: 20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.touch_app_outlined, size: 24, color: AppColors.BaseColorWhite),
                          SizedBox(width: 10,),
                          Text('Face ID/Touch ID', style: TextStyle(fontSize: 18, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.BaseColorWhite),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
