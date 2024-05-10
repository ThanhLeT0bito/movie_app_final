import 'package:flutter/material.dart';
import 'package:movie_app_final/screens/search_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.mic,
                  color: Colors.white), // Thêm màu trắng cho icon search
              onPressed: () {
                // Xử lý khi nhấn vào icon search
              },
            ),
            Expanded(
              child: TextField(
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
                readOnly: true,
                style: const TextStyle(
                    color: Colors
                        .white), // Đặt màu chữ của TextField thành màu trắng
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                      color:
                          Colors.white), // Đặt màu chữ cho hint thành màu trắng
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search,
                  color: Colors.white), // Thêm màu trắng cho icon microphone
              onPressed: () {
                // Xử lý khi nhấn vào icon microphone
              },
            ),
          ],
        ),
      ),
    );
  }
}
