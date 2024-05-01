import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/date.dart';
import 'package:movie_app_final/models/model_widget/seat.dart';
import 'package:movie_app_final/models/model_widget/time.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/providers/seats_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/payment_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_popup.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  static const routeName = '/select-seat';

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  // @override
  // void initState() {
  //   _initSeats();
  //   super.initState();
  // }

  Future<void> _initSeats() async {
    {
      await Provider.of<SeatsProviders>(context, listen: false)
          .InitSeatResrved();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // data
    final data = Provider.of<SeatsProviders>(context);
    final dataOrder = Provider.of<OrdersProvider>(context);
    final dataSeat = Provider.of<SeatsProviders>(context);

    final listSeats = data.listSeat;
    final listDates = data.listDate;
    final listTimes = data.listTime;
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const CustomAppBar(
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
                  return ItemSeat(seat: listSeats[index]);
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listDates.map((e) => ItemDate(date: e)).toList(),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listTimes
                      .map((e) => ItemTime(
                            time: e,
                          ))
                      .toList(),
                )),
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
                            if (data.getListSeatSelected() == '') {
                              CustomDialogHelper.showCustomDialog(
                                  context, "Please Select Seat!", "seat.svg");
                              return;
                            }

                            if (data.currentDateSeat == null) {
                              CustomDialogHelper.showCustomDialog(
                                  context, "Please Select Date!", "date.svg");
                              return;
                            }

                            if (data.currentTimeSeat == null) {
                              CustomDialogHelper.showCustomDialog(
                                  context, "Please Select Time!", "time.svg");
                              return;
                            }

                            dataOrder.currentSeats = data.getListSeatSelected();
                            dataSeat.currentListSeat =
                                data.getListSeatSelected();

                            dataOrder.currentDateMovie =
                                "${data.currentDateSeat!.day}/${data.getMonthValue(data.currentDateSeat!.month).toString()}/${DateTime.now().year}";
                            dataOrder.currentTimeMovie =
                                data.currentTimeSeat!.time;
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

class ItemSeat extends StatelessWidget {
  const ItemSeat({
    super.key,
    required this.seat,
  });

  final Seat seat;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SeatsProviders>(context);
    final dataOrder = Provider.of<OrdersProvider>(context);

    Color background = AppColors.ItemSeatBackGroundAvailable;
    Color textColor = AppColors.BaseColorWhite;

    if (seat.status == Status.resered) {
      background = AppColors.ReseredColor;
      textColor = AppColors.BaseColorMain;
    } else if (seat.status == Status.selected) {
      background = AppColors.BaseColorMain;
      textColor = AppColors.BaseColorBlack;
    }
    return GestureDetector(
      onTap: () {
        data.changeStatusSeat(seat);
        if (seat.status == Status.resered) {
          CustomDialogHelper.showCustomDialog(
              context, "please seleted another seat!", 'close.svg');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            seat.name,
            style: TextStyle(color: textColor),
          ),
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
      ..shader = const LinearGradient(
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
    required this.time,
  });
  final TimeSeat time;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SeatsProviders>(context);
    return GestureDetector(
      onTap: (() {
        data.SelectTime(time);
      }),
      child: Container(
        width: 100,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: time.isSelected!
                ? AppColors.BackGroundTimeSelected
                : AppColors.BackGroundItemDate,
            borderRadius: BorderRadius.circular(30),
            border: time.isSelected!
                ? Border.all(color: AppColors.BaseColorMain)
                : null),
        child: Center(
          child: Text(
            time.time,
            style: const TextStyle(
                color: AppColors.BaseColorWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ItemDate extends StatelessWidget {
  const ItemDate({
    super.key,
    required this.date,
  });

  final DateSeat date;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SeatsProviders>(context);
    return GestureDetector(
      onTap: () {
        data.SelectDate(date);
      },
      child: Container(
        height: 120,
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: date.isSelected!
              ? AppColors.BaseColorMain
              : AppColors.BackGroundItemDate,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  date.month,
                  style: TextStyle(
                      color: date.isSelected!
                          ? AppColors.BaseColorBlack
                          : AppColors.BaseColorWhite,
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
                  color: date.isSelected!
                      ? AppColors.BaseColorBlack
                      : AppColors.BackGroundItemDay),
              child: Center(
                  child: Text(
                date.day,
                style: const TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
