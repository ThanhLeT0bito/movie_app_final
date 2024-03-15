import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomepageScreens extends StatefulWidget {
  const HomepageScreens({Key? key}) : super(key: key);
  static const routeName = '/home-page'; 

  @override
  State<HomepageScreens> createState() => _HomepageScreensState();
}

class _HomepageScreensState extends State<HomepageScreens> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black, // Đặt màu nền của Scaffold thành đen
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.change_circle_sharp, color: Colors.white, size: 30,), // Biểu tượng trái
              Text(
                'Welcome back',
                style: TextStyle(color: Colors.white, fontSize: 25), // Màu văn bản là trắng
              ),
              Icon(Icons.notifications, color: Colors.white, size: 30,), // Biểu tượng phải
            ],
          ),
          backgroundColor: Colors.black, // Đặt màu nền của AppBar thành đen
          centerTitle: true, // Căn giữa tiêu đề
          automaticallyImplyLeading: false, // Tắt nút back
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.white), // Thêm màu trắng cho icon search
                        onPressed: () {
                          // Xử lý khi nhấn vào icon search
                        },
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white), // Đặt màu chữ của TextField thành màu trắng
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.white), // Đặt màu chữ cho hint thành màu trắng
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.mic, color: Colors.white), // Thêm màu trắng cho icon microphone
                        onPressed: () {
                          // Xử lý khi nhấn vào icon microphone
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Now Playing',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        // Xử lý khi nhấn vào nút "See All"
                      },
                      child: Row(
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14,), // Icon
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Thêm các phần tử khác tại đây
                // Thêm Carousel ở đây
                CarouselSlider(
  options: CarouselOptions(
    height: 200.0,
    aspectRatio: 16 / 9,
    viewportFraction: 0.8,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 2),
    autoPlayAnimationDuration: Duration(milliseconds: 200),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
  ),
  items: [ 
    // 'https://kenh14cdn.com/thumb_w/600/2015/elbnca-special-poster2-small-1449142035822.jpg'
    // 'https://kenh14cdn.com/thumb_w/600/2015/elbnca-special-poster2-small-1449142035822.jpg'
    // 'https://kenh14cdn.com/thumb_w/600/2015/elbnca-special-poster2-small-1449142035822.jpg'
    // 'https://kenh14cdn.com/thumb_w/600/2015/elbnca-special-poster2-small-1449142035822.jpg'
  ].map((item) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Image.network(
            item,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }).toList(),
)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
