import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_payment_method.dart';
import 'package:movie_app_final/widgets/Base/custom_popup.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';

class PaymentScreens extends StatefulWidget {
  const PaymentScreens({Key, key}) : super(key: key);
  static const routeName = '/payment';

  @override
  State<PaymentScreens> createState() => _PaymentScreensState();
}

class _PaymentScreensState extends State<PaymentScreens> {
  late List<bool> _isSelectedList;

  @override
  void initState() {
    super.initState();
    _isSelectedList = [
      false,
      false,
      false,
      false,
      false
    ]; // Khởi tạo danh sách trạng thái
  }

  void _updateSelectedIndex(int index, BuildContext context) {
    var dataOrder = Provider.of<OrdersProvider>(context, listen: false);
    dataOrder.currentSelectedPaymentType = index;

    setState(() {
      for (int i = 0; i < _isSelectedList.length; i++) {
        _isSelectedList[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var dataOrder = Provider.of<OrdersProvider>(context);

    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const CustomAppBar(
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
                        'assets/images/img_3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mai',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.BaseColorTextMain,
                            ),
                          ),
                          SizedBox(height: Dimens.Sizedbox),
                          Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: AppColors.BaseColorWhite,
                              ),
                              SizedBox(width: Dimens.Sizedbox),
                              Text(
                                'Emotional, psychological',
                                style: TextStyle(
                                  fontSize: Dimens.fontsize,
                                  color: AppColors.BaseColorWhite,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimens.Sizedbox),
                          Row(
                            children: [
                              Icon(
                                Icons.location_city,
                                color: AppColors.BaseColorWhite,
                              ),
                              SizedBox(width: Dimens.Sizedbox),
                              Text(
                                'Vincom Ocean Park CGV',
                                style: TextStyle(
                                  fontSize: Dimens.fontsize,
                                  color: AppColors.BaseColorWhite,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimens.Sizedbox),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: AppColors.BaseColorWhite,
                              ),
                              SizedBox(width: Dimens.Sizedbox),
                              Text(
                                '28.02.2024 • 14:15',
                                style: TextStyle(
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
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
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
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                          child: const Row(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.BaseColorMain,
                          ),
                          child: const Center(
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
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: AppColors.BaseColorAroundWhite,
                  thickness: 0.5,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                PaymentMethod(
                  img: 'assets/images/zalo.jpg',
                  title: 'Zalo Pay',
                  isSelected: _isSelectedList[0],
                  onTap: () {
                    _updateSelectedIndex(0, context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(
                  img: 'assets/images/momo.png',
                  title: 'Momo',
                  isSelected: _isSelectedList[1],
                  onTap: () {
                    _updateSelectedIndex(1, context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(
                  img: 'assets/images/shoppe.png',
                  title: 'Shoppe Pay',
                  isSelected: _isSelectedList[2],
                  onTap: () {
                    _updateSelectedIndex(2, context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(
                  img: 'assets/images/atm card.png',
                  title: 'ATM Card',
                  isSelected: _isSelectedList[3],
                  onTap: () {
                    _updateSelectedIndex(3, context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentMethod(
                  img: 'assets/images/atm.png',
                  title: 'International payments',
                  isSelected: _isSelectedList[4],
                  onTap: () {
                    _updateSelectedIndex(4, context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
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
                onPressed: () async {
                  if (dataOrder.currentSelectedPaymentType == -1) {
                    CustomDialogHelper.showCustomDialog(
                        context, "Please Select Payment Type!", "payment.svg");
                    return;
                  }

                  // insert new order to server
                  await dataOrder.createNewOrder();
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, TicketScreen.routeName,
                      arguments: dataOrder.currentOrderModel);
                }),
          ]),
        ),
      ),
    );
  }
}
