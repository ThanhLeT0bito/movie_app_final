import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/payment_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  static const routeName = '/select-seat';

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> listSeats = [];
    for (var i = 'A'.codeUnitAt(0); i <= 'F'.codeUnitAt(0); i++) {
      for (var j = 1; j <= 8; j++) {
        listSeats.add(String.fromCharCode(i) + j.toString());
      }
    }
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            CustomAppBar(
              title: "Select Seat",
            ),
            SizedBox(height: 20),
            Container(
              height: 5,
              width: screenWidth - 60,
              color: AppColors.BaseColorMain,
            ),
            CustomPaint(
              size: Size(screenWidth, 70),
              painter: MyPainter(),
            ),
            Container(
              height: 340,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: listSeats.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.ItemSeatBackGroundAvailable,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        listSeats[index],
                        style: TextStyle(color: AppColors.BaseColorWhite),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      color: AppColors.ItemSeatBackGroundAvailable,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Availabel",
                      style: TextStyle(
                          color: AppColors.BaseColorWhite, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      color: AppColors.ReseredColor,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Resered",
                      style: TextStyle(
                          color: AppColors.BaseColorWhite, fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      color: AppColors.BaseColorMain,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Selected",
                      style: TextStyle(
                          color: AppColors.BaseColorWhite, fontSize: 18),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Date & Time",
              style: TextStyle(
                  color: AppColors.BaseColorWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemDate(isSelected: false),
                  ItemDate(isSelected: false),
                  ItemDate(isSelected: true),
                  ItemDate(isSelected: false),
                  ItemDate(isSelected: false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ItemTime(isSelected: false),
                ItemTime(isSelected: true),
                ItemTime(isSelected: false),
                ItemTime(isSelected: false),
                ItemTime(isSelected: false),
              ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: AppColors.BaseColorWhite,
                          ),
                        ),
                        Text(
                          "210.000 VND",
                          style: TextStyle(
                              color: AppColors.BaseColorTextMain,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: CustomTextButton(
                          text: "Buy Ticket",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, PaymentScreens.routeName);
                          }))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(120, 255, 123, 0),
          Colors.black54
        ], // Gradient colors
      ).createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(20, 0) // Điểm bắt đầu ở trên cùng bên trái
      ..lineTo(0, size.height) // Điểm dưới cùng bên trái
      ..lineTo(size.width, size.height) // Điểm dưới cùng bên phải
      ..lineTo(size.width - 20, 0) // Điểm bắt đầu ở trên cùng bên phải
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ItemTime extends StatelessWidget {
  const ItemTime({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: isSelected
              ? AppColors.BackGroundTimeSelected
              : AppColors.BackGroundItemDate,
          borderRadius: BorderRadius.circular(30),
          border:
              isSelected ? Border.all(color: AppColors.BaseColorMain) : null),
      child: const Center(
        child: Text(
          "12:00",
          style: TextStyle(
              color: AppColors.BaseColorWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ItemDate extends StatelessWidget {
  const ItemDate({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color:
            isSelected ? AppColors.BaseColorMain : AppColors.BackGroundItemDate,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "Dec",
                style: TextStyle(
                    color: isSelected
                        ? AppColors.BaseColorBlack
                        : AppColors.BaseColorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.BaseColorBlack
                    : AppColors.BackGroundItemDay),
            child: const Center(
                child: Text(
              "10",
              style: TextStyle(
                  color: AppColors.BaseColorWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )),
          )
        ],
      ),
    );
  }
}
