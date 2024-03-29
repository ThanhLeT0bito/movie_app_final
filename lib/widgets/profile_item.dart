import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/profile_model.dart';
import 'package:movie_app_final/models/user.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.currentUser});
  final User currentUser;

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
              padding: const EdgeInsets.only(
                left: Dimens.PaddingBackgroundProfile,
                right: Dimens.PaddingBackgroundProfile,
                top: Dimens.PaddingBackgroundProfile,
              ),
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
                          backgroundImage: AssetImage('assets/images/avatar.jpg'),
                        ),
                      ),
                      const SizedBox(width: Dimens.SizedBoxHeightProfile),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser.name,
                            style: const TextStyle(
                                fontSize: Dimens.SizeIconProfile,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: Dimens.SizedBoxHeightProfile),
                          Row(
                            children: [
                              const Icon(Icons.email,
                                  color: AppColors.BaseColorWhite,
                                  size: Dimens.SizeIconProfile),
                              const SizedBox(
                                  width: Dimens.SizedBoxWidthProfile),
                              Text(
                                currentUser.mail,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  color: AppColors.BaseColorWhite,
                                  size: Dimens.SizeIconProfile),
                              const SizedBox(
                                  width: Dimens.SizedBoxWidthProfile),
                              Text(
                                currentUser.phone,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white), // thêm Dimens
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit,
                        color: Colors.white, size: Dimens.SizeIconProfile),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimens.SizeBoxHeightInfor),
            const Padding(
              padding: EdgeInsets.only(
                  left: Dimens.PaddingBackgroundProfile,
                  right: Dimens.PaddingBackgroundProfile),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.tiktok,
                              size: Dimens.SizeIconProfile,
                              color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile),
                          Text('My ticket',
                              style: TextStyle(
                                  fontSize: Dimens.fontsizetext,
                                  color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: Dimens.SizeIconArrow,
                          color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider(
                    color: Colors.grey,
                    thickness: Dimens.thickness,
                  ),
                  SizedBox(
                    height: Dimens.SizedBoxHeightProfile,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart,
                              size: Dimens.SizeIconProfile,
                              color: AppColors.BaseColorWhite),
                          SizedBox(
                            width: Dimens.SizedBoxWidthProfile,
                          ),
                          Text('Payment history',
                              style: TextStyle(
                                  fontSize: Dimens.fontsizetext,
                                  color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: Dimens.SizeIconArrow,
                          color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider(
                    color: Colors.grey,
                    thickness: Dimens.thickness,
                  ),
                  SizedBox(
                    height: Dimens.SizedBoxHeightProfile,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.language,
                              size: Dimens.SizeIconProfile,
                              color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile),
                          Text('Change language',
                              style: TextStyle(
                                  fontSize: Dimens.fontsizetext,
                                  color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: Dimens.SizeIconArrow,
                          color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider(
                    color: Colors.grey,
                    thickness: Dimens.thickness,
                  ),
                  SizedBox(
                    height: Dimens.SizedBoxHeightProfile,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock,
                              size: Dimens.SizeIconProfile,
                              color: AppColors.BaseColorWhite),
                          SizedBox(width: Dimens.SizedBoxWidthProfile),
                          Text('Change password',
                              style: TextStyle(
                                  fontSize: Dimens.fontsizetext,
                                  color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: Dimens.SizeIconArrow,
                          color: AppColors.BaseColorWhite),
                    ],
                  ),
                  SizedBox(height: Dimens.SizedBoxHeightProfile),
                  Divider(
                    color: Colors.grey,
                    thickness: Dimens.thickness,
                  ),
                  SizedBox(
                    height: Dimens.SizedBoxHeightProfile,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.touch_app_outlined,
                              size: Dimens.SizeIconProfile,
                              color: AppColors.BaseColorWhite),
                          SizedBox(
                            width: Dimens.SizedBoxWidthProfile,
                          ),
                          Text('Face ID/Touch ID',
                              style: TextStyle(
                                  fontSize: Dimens.fontsizetext,
                                  color: AppColors.BaseColorWhite)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: Dimens.SizeIconArrow,
                          color: AppColors.BaseColorWhite),
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
