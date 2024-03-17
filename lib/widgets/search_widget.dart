import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.search,
                color: Colors.white), // Thêm màu trắng cho icon search
            onPressed: () {
              // Xử lý khi nhấn vào icon search
            },
          ),
          const Expanded(
            child: TextField(
              style: TextStyle(
                  color: Colors
                      .white), // Đặt màu chữ của TextField thành màu trắng
              decoration: InputDecoration(
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
            icon: Icon(Icons.mic,
                color: Colors.white), // Thêm màu trắng cho icon microphone
            onPressed: () {
              // Xử lý khi nhấn vào icon microphone
            },
          ),
        ],
      ),
    );
  }
}
