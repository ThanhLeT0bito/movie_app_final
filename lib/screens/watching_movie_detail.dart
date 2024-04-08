import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:movie_app_final/widgets/list_widget.dart';

import '../widgets/Base/custom_bottom_navigator.dart';
import '../widgets/custom_item_bottom__bar.dart';

class WatchingDetailsScreens extends StatefulWidget {
  const WatchingDetailsScreens({Key? key}) : super(key: key);
  static const routeName = '/watching-details-screen';

  @override
  _WatchingDetailsScreensState createState() => _WatchingDetailsScreensState();
}

class _WatchingDetailsScreensState extends State<WatchingDetailsScreens> {
  int _selectedIndex = 0;
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

  late List<ItemwithLineTopWidget> listTypes = [
    ItemwithLineTopWidget(text: 'Epside', hasBar: false),
    ItemwithLineTopWidget(text: 'More', hasBar: true),
    ItemwithLineTopWidget(text: 'Trailer', hasBar: false),
  ];
  void changeItemType(ItemwithLineTopWidget selectedItem) {
    setState(() {
      for (var item in listTypes) {
        item.hasBar = (item == selectedItem);
      }
      print(selectedItem.text);
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
                  listTypes: listTypes,
                  func: changeItemType,
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

class ItemwithLineTopWidget extends StatelessWidget {
  ItemwithLineTopWidget({
    super.key,
    required this.text,
    required this.hasBar,
  });
  final String text;
  late bool hasBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: hasBar
                  ? AppColors.BaseColorMain
                  : AppColors.BaseColorTransparent,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  MainContent({
    Key? key,
    required this.screenWidth,
    required this.bottomNavBarItems,
    required this.onItemTapped,
    required this.listTypes,
    required this.func,
  }) : super(key: key);

  final double screenWidth;
  final List<CustomItemBottomBar> bottomNavBarItems;
  final Function(int) onItemTapped;
  final List<ItemwithLineTopWidget> listTypes;
  final Function(ItemwithLineTopWidget) func;

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  List<Widget> listWidgetType = [
    EpisodeWidget(),
    MovieWidget(),
  ];
  int index =0;
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                  bottomNavBarItems: widget.bottomNavBarItems,
                  onItemTapped: widget.onItemTapped,
                  selectedIndex: 0, // Chỉ số này có thể được thay
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              index==0;
                            });
                          },
                          child: 
                         ItemwithLineTopWidget(text: 'Episode', hasBar: index == 0),
                      ),
                        ItemwithLineTopWidget(text: 'More', hasBar: index == 1),
                        ItemwithLineTopWidget(text: 'Trailer', hasBar: index == 2),
                      ],
                    ),
                  ),
                SizedBox(height: 10),
                listWidgetType[index]
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
  });

  @override 
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screensWidth=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _buildEpisodeItem(
            imageUrl: 'assets/images/t4.png',
            episodeTitle: 'Episode 1',
            time:'25m',
            actor:'Romance, psychology',
            screensWidth: screensWidth
          ),
          _buildEpisodeItem(
            imageUrl: 'assets/images/t4.png',
            episodeTitle: 'Episode 2',
            time:'25m',
            actor:'Romance, psychology',
            screensWidth: screensWidth

          ),
          _buildEpisodeItem(
            imageUrl: 'assets/images/t4.png',
            episodeTitle: 'Episode 3',
            time:'25m',
            actor:'Romance, psychology',
            screensWidth: screensWidth

          ),
          // Add more episodes if needed
        ],
      ),
    );
  }

  Widget _buildEpisodeItem({required String imageUrl, required String episodeTitle, required String time, required String actor,required double screensWidth}) {
  return Container(
    width: screensWidth,
    padding: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image on the left
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16), // Add some space between image and text
              // Text on the right
              Container(
                width: 170, // Set a fixed width for the column
                height: 100, // Set a fixed height for the column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episodeTitle,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                    ),
                    SizedBox(height: 10), // Add some space
                    Text(
                      time,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10), // Add some space
                    Text(
                      actor,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              //SizedBox(width: 10), // Add some space between text and icon
              // Download icon
              Icon(Icons.file_download_outlined, color: Colors.white),
            ],
          ),
        ),
        // Icon centered vertically
      ],
    ),
  );
}
}