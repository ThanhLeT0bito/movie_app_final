import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemServiceWidget extends StatelessWidget {
  const ItemServiceWidget({
    super.key,
    required this.img,
    this.title,
  });
  final String img;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors
                  .transparent, // Đặt màu nền là trong suốt để hình tròn hiển thị đúng
            ),
            child: ClipOval(
              child: Image.asset(
                img,
                width: 80,
                height: 80,
                fit: BoxFit
                    .cover, // Đảm bảo hình ảnh phù hợp với kích thước hình tròn
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(
              color: AppColors.BaseColorWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
