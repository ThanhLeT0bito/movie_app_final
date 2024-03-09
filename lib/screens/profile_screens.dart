import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

import '../resources/dimens.dart';

class HomeProfileScreens extends StatefulWidget {
  const HomeProfileScreens({Key? key}) : super(key: key);

  static const routeName = '/home-profile-movie';

  @override
  State<HomeProfileScreens> createState() => _ProfileScreensState();
}



class _ProfileScreensState extends State<HomeProfileScreens> {
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
              padding: const EdgeInsets.only(left: Dimens.PaddingBackgroundProfile, right: Dimens.PaddingBackgroundProfile,top:Dimens.PaddingBackgroundProfile,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.BaseColorWhite,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/avatar.jpg'),
                        ),
                      ),
                      const SizedBox(width: Dimens.SizedBoxHeightProfile),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Angelina',
                            style: TextStyle(fontSize: Dimens.SizeIconProfile, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: Dimens.SizedBoxHeightProfile),
                          Row(
                            children: [
                              Icon(Icons.email, color: AppColors.BaseColorWhite, size: Dimens.SizeIconProfile),
                              SizedBox(width: Dimens.SizedBoxWidthProfile),
                              Text(
                                'angelina@example.com',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, color: AppColors.BaseColorWhite, size: Dimens.SizeIconProfile),
                              SizedBox(width: Dimens.SizedBoxWidthProfile),
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
                    icon: const Icon(Icons.edit, color: Colors.white, size: Dimens.SizeIconProfile),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            const Padding(
              padding: EdgeInsets.only(left: Dimens.PaddingBackgroundProfile, right: Dimens.PaddingBackgroundProfile),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.tiktok, size: Dimens.SizeIconProfile, color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile),
                          Text('My ticket', style: TextStyle(fontSize: Dimens.fontsizetext, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: Dimens.SizeIconArrow, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider(
                    color: Colors.grey,
                    thickness: Dimens.thickness, 
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart, size: Dimens.SizeIconProfile, color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile,),
                          Text('Payment history', style: TextStyle(fontSize: Dimens.fontsizetext, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: Dimens.SizeIconArrow, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider( 
                    color: Colors.grey,
                    thickness: Dimens.thickness, 
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.language, size: Dimens.SizeIconProfile, color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile),
                          Text('Change language', style: TextStyle(fontSize: Dimens.fontsizetext, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: Dimens.SizeIconArrow, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider( 
                    color: Colors.grey,
                    thickness: Dimens.thickness, 
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.password_sharp, size: Dimens.SizeIconProfile, color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile),
                          Text('Change password', style: TextStyle(fontSize: Dimens.fontsizetext, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: Dimens.SizeIconArrow, color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider( 
                    color: Colors.grey,
                    thickness: Dimens.thickness, 
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      Row(
                        children: [
                          Icon(Icons.touch_app_outlined, size: Dimens.SizeIconProfile, color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile,),
                          Text('Face ID/Touch ID', style: TextStyle(fontSize: Dimens.fontsizetext, color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: Dimens.SizeIconArrow, color: AppColors.BaseColorWhite),
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
