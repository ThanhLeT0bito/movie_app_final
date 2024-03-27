import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

import '../widgets/Base/custom_bottom_navigator.dart';
import '../widgets/custom_item_bottom__bar.dart';

class WatchingDetailsScreens extends StatefulWidget {
  const WatchingDetailsScreens({Key? key}) : super(key: key);
  static const routeName = '/watching-details-screen';

  @override
  _WatchingDetailsScreensState createState() => _WatchingDetailsScreensState();
}

class _WatchingDetailsScreensState extends State<WatchingDetailsScreens> {
  int _selectedIndex = 1;
  late List<CustomItemBottomBar> bottomNavBarItems;

  @override
  void initState() {
    super.initState();

    ///Item bottom navigation
    bottomNavBarItems = [
      CustomItemBottomBar(
        icon: Iconsax.heart,
        label: "Love",
        isSelected: _selectedIndex == 0,
      ),
      CustomItemBottomBar(
        icon: Icons.file_download_outlined,
        label: "Download",
        isSelected: _selectedIndex == 1,
      ),
      CustomItemBottomBar(
        icon: Icons.share,
        label: "Share",
        isSelected: _selectedIndex == 2,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/img_3.jpg",
                  width: double.infinity,
                  height: 237,
                  fit: BoxFit.cover,
                ),
                MainContent(
                  screenWidth: screenWidth,
                  bottomNavBarItems: bottomNavBarItems,
                  onItemTapped: _onItemTapped,
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 5,
            right: 0,
            child: CustomAppBar(),
          )
        ],
      ),
    );
  }
}

Widget _buildItemWithBar(String text, bool hasBar) {
  return Stack(
    children: [
      Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      if (hasBar) // Chỉ hiển thị thanh màu cam nếu có
        Positioned(
          top: -10, // Điều chỉnh vị trí của thanh màu cam
          left: 0,
          right: 0,
          child: Container(
            height: 12, // Điều chỉnh chiều cao của thanh màu cam
            width: 104, // Điều chỉnh chiều dài của thanh màu cam
            color: Colors.orangeAccent,
          ),
        ),
    ],
  );
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.screenWidth,
    required this.bottomNavBarItems,
    required this.onItemTapped,
  }) : super(key: key);

  final double screenWidth;
  final List<CustomItemBottomBar> bottomNavBarItems;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Mai",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 25,
                          color: AppColors.BaseColorWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "2024 • 2h11m • 18+",
                      style: TextStyle(
                          color: AppColors.BaseColorAroundWhite,
                          fontSize: 15,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextButton(
                    text: 'Play',
                    icon: Icons.play_arrow_rounded,
                    onPressed: () {
                      Navigator.pushNamed(context, SelectSeatScreen.routeName);
                    }),
                const SizedBox(height: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"Mai" is the story of Mai, a masseuse with a special fate. She often faces criticism from society and her meeting with Duong - a flower boy, awakens in her a desire for a new life...',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                        height: 5), // Khoảng cách giữa nội dung và "See more"
                    Text(
                      'See more',
                      style: TextStyle(
                        color: AppColors.BaseColorTextMain,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Movie genre:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Romance, psychology', // Chữ thêm vào
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Director:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Trấn Thành',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Actor:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Phương Anh Đào, Tuấn Trần, Trấn Thành...',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomBottomNavigationBar(
                  bottomNavBarItems: bottomNavBarItems,
                  onItemTapped: onItemTapped,
                  selectedIndex: 0, // Chỉ số này có thể được thay
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildItemWithBar('Epside', true),
                      _buildItemWithBar('More', false),
                      _buildItemWithBar('Trailer', false),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Xử lý khi nhấn vào hình ảnh
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey, // Màu nền của hình ảnh
                        ),
                        child: Center(
                          child: Text(
                            'Image ${index + 1}', // Hiển thị văn bản hoặc hình ảnh thực tế tại đây
                            style: TextStyle(
                              color: Colors.white, // Màu văn bản hoặc hình ảnh
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
