import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_payment_method.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class PaymentScreens extends StatefulWidget {
  const PaymentScreens({Key, key}) : super(key: key);
  static const routeName = 'payment';

  @override
  State<PaymentScreens> createState() => _PaymentScreensState();
}

class _PaymentScreensState extends State<PaymentScreens> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            CustomAppBar(
              title: "Payment",
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: Dimens.MarginTicketItem,
                horizontal: Dimens.MarginTicketItem,
              ),
              decoration: BoxDecoration(
                color: AppColors.Background,
                borderRadius: BorderRadius.circular(Dimens.circular),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Dimens.WidthItemTicket,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimens.circular),
                        bottomLeft: Radius.circular(Dimens.circular),
                      ),
                      child: Image.asset(
                        'assets/img_3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mai',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.BaseColorTextMain,
                            ),
                          ),
                          const SizedBox(height: Dimens.Sizedbox),
                          Row(
                            children: [
                              const Icon(
                                Icons.play_arrow,
                                color: AppColors.BaseColorWhite,
                              ),
                              const SizedBox(width: Dimens.Sizedbox),
                              Text(
                                'Emotional, psychological',
                                style: const TextStyle(
                                  fontSize: Dimens.fontsize,
                                  color: AppColors.BaseColorWhite,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Dimens.Sizedbox),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_city,
                                color: AppColors.BaseColorWhite,
                              ),
                              const SizedBox(width: Dimens.Sizedbox),
                              Text(
                                'Vincom Ocean Park CGV',
                                style: const TextStyle(
                                  fontSize: Dimens.fontsize,
                                  color: AppColors.BaseColorWhite,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Dimens.Sizedbox),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: AppColors.BaseColorWhite,
                              ),
                              const SizedBox(width: Dimens.Sizedbox),
                              Text(
                                '28.02.2024 • 14:15',
                                style: const TextStyle(
                                  fontSize: Dimens.fontsize,
                                  color: AppColors.BaseColorWhite,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '78889377726',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seat',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'H7,H8',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.BaseColorBlackGround,
              child: Column(children: [
                SizedBox(height: 20),
                Container(
                  width: screenWidth - 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 175, // Đảm bảo Container có kích thước cụ thể
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.discount,
                                color: AppColors.BaseColorAroundWhite,
                              ),
                              SizedBox(
                                  width:
                                      5), // Khoảng cách giữa biểu tượng và văn bản
                              Text(
                                "discount code",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.BaseColorAroundWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 120, // Đảm bảo Container có kích thước cụ thể
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.BaseColorMain,
                          ),
                          child: Center(
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.BaseColorBlack),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: AppColors.BaseColorAroundWhite,
                  thickness: 0.5,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '189.000 VND',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.BaseColorTextMain,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          color: AppColors.BaseColorWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(img: 'assets/zalo.jpg', title: 'Zalo Pay'),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(img: 'assets/momo.png', title: 'Momo'),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(img: 'assets/shoppe.png', title: 'Shoppe Pay'),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(img: 'assets/atm card.png', title: 'ATM Card'),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(
                    img: 'assets/atm.png', title: 'International payments'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Complete your payment in',
                        style: TextStyle(
                            fontSize: 16.0, color: AppColors.BaseColorWhite),
                      ),
                      Text(
                        '15:00',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: AppColors.BaseColorTextMain,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, TicketScreen.routeName);
                }),
          ]),
        ),
      ),
    );
  }
}
