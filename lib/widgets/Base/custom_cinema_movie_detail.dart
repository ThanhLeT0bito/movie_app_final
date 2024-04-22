import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ChooseCinema extends StatefulWidget {
  const ChooseCinema({super.key});

  @override
  State<ChooseCinema> createState() => _ChooseCinemaState();
}

class _ChooseCinemaState extends State<ChooseCinema> {
  int _selectedContainerIndex =
      -1; // Khởi tạo biến để lưu trạng thái container được chọn

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cinema',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedContainerIndex =
                  0; // Cập nhật trạng thái container khi được chọn
            });
          },
          child: Container(
            width: 500,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: _selectedContainerIndex == 0
                        ? AppColors.BaseColorMain
                        : Colors.grey.shade900,
                    width: 2)),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vincom Ocean Park CGV',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '4.55 km | Da Ton, Gia Lam, Ha Noi',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Khoảng cách giữa chữ và logo
                Container(
                  width: 50, // Điều chỉnh kích thước của logo
                  height: 20, // Điều chỉnh kích thước của logo
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/images/cgv.png'),
                      // Đường dẫn tới logo
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.dstIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedContainerIndex =
                  1; // Cập nhật trạng thái container khi được chọn
            });
          },
          child: Container(
            width: 500,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _selectedContainerIndex == 1
                      ? AppColors.BaseColorMain
                      : Colors.grey.shade900,
                  width: 2,
                )),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aeon Mall CGV',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '9.32 km | 27 Co Linh, Long Bien, Ha Noi',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Khoảng cách giữa chữ và logo
                Container(
                  width: 50, // Điều chỉnh kích thước của logo
                  height: 20, // Điều chỉnh kích thước của logo
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/cgv.png'), // Đường dẫn tới logo
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.dstIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedContainerIndex =
                  2; // Cập nhật trạng thái container khi được chọn
            });
          },
          child: Container(
            width: 500,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _selectedContainerIndex == 2
                      ? AppColors.BaseColorMain
                      : Colors.grey.shade900,
                  width: 2,
                )),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lotte Cinema Long Bien',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '14.3 km | 7-9 Nguyen Van Linh, Long Bien, Ha Noi',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Khoảng cách giữa chữ và logo
                Container(
                  width: 50, // Điều chỉnh kích thước của logo
                  height: 20, // Điều chỉnh kích thước của logo
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/lotte.png'), // Đường dẫn tới logo
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
