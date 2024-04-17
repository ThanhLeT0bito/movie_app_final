import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: 0.7,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(9, (index) {
        return GestureDetector(
          onTap: () {
            // Xử lý khi nhấn vào hình ảnh
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: const DecorationImage(
                image: AssetImage('assets/images/insite_out.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }),
    );
  }
}