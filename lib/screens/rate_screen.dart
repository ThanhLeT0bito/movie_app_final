import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});
  static const String routeName = '/rate-screen';

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenheight,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                const CustomAppBar(
                  title: "My Ticket",
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.BaseColorWhite,
                        borderRadius: BorderRadius.circular(12)),
                    child: const ImageAndTitleWidget()),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    margin: const EdgeInsets.all(10),
                    decoration:
                        const BoxDecoration(color: AppColors.BaseColorWhite),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.BaseColorMain,
                              size: 40,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.BaseColorMain,
                              size: 40,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.BaseColorMain,
                              size: 40,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.BaseColorMain,
                              size: 40,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.BaseColorGrey,
                              size: 40,
                            ),
                          ],
                        ),
                        const TextField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(123, 158, 158, 158),
                            hintText: 'Enter your text',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                        CustomTextButton(text: "Rating Movie", onPressed: () {})
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
