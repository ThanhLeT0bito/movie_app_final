import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ComingSoonScreens extends StatefulWidget {
  const ComingSoonScreens({Key? key}) : super(key: key);

  static const routeName = '/home-comingsoon-movie';

  @override
  State<ComingSoonScreens> createState() => _ComingSoonScreensState();
}

class _ComingSoonScreensState extends State<ComingSoonScreens> {
  bool isNowPlayingPressed = false;
  bool isComingSoonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Căn hai nút giữa cùng hàng
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNowPlayingPressed = true;
                    isComingSoonPressed = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isNowPlayingPressed ? Colors.orange : Colors.grey,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150, 60),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Now playing',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isComingSoonPressed = true;
                    isNowPlayingPressed = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isComingSoonPressed ? Colors.orange : Colors.grey,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150, 60),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Coming Soon',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildMovieGrid(),
        ],
      ),
    );
  }

  Widget _buildMovieGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildMovieInfo(
          'Avatar',
          '14h30 . 15.03.2024',
          5,
          'assets/img_1.jpg',
        ),
        _buildMovieInfo(
          'Inception',
          '16h45 . 20.03.2024',
          4,
          'assets/img_1.jpg',
        ),
        _buildMovieInfo(
          'Interstellar',
          '19h00 . 25.03.2024',
          4,
          'assets/img_1.jpg',
        ),
      ],
    );
  }

  Widget _buildMovieInfo(String movieName, String dateTime, int rating, String imagePath) {
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 150,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Text(
            movieName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            dateTime,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              rating,
              (index) => const Icon(Icons.star, color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}
