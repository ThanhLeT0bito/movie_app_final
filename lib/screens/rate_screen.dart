import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({Key? key}) : super(key: key); // Fix super.key

  static const String routeName = '/rate-screen';

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  int starCount = 0; // Declare starCount variable
  String starMessage = ''; // Declare starMessage variable

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ImageAndTitleWidget(),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.BaseColorWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ // Add children property for Row
                            StarRatingWidget(
                              starCount: starCount,
                              onRatingChanged: (rating) {
                                setState(() {
                                  starCount = rating;
                                  // Cập nhật tin nhắn dựa trên số sao được chọn
                                  switch (starCount) {
                                    case 1:
                                      starMessage = '';
                                      break;
                                    case 2:
                                      starMessage = '';
                                      break;
                                    case 3:
                                      starMessage = '';
                                      break;
                                    case 4:
                                      starMessage = '';
                                      break;
                                    case 5:
                                      starMessage = '';
                                      break;
                                    default:
                                      starMessage = '';
                                  }
                                });
                              },
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
                        CustomTextButton(
                          text: "Rating Movie",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, HomepageScreens.routeName);
                          },
                        )
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


class StarRatingWidget extends StatefulWidget {
  final int starCount;
  final Function(int rating) onRatingChanged;

  StarRatingWidget({required this.starCount, required this.onRatingChanged});

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.starCount;
  }

  @override
  void didUpdateWidget(StarRatingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.starCount != widget.starCount) {
      _currentRating = widget.starCount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return Container(
          child: IconButton(
            onPressed: () {
              setState(() {
                _currentRating = index + 1;
              });
              widget.onRatingChanged(_currentRating);
            },
            icon: Icon(
              index < _currentRating ? Icons.star : Icons.star_border,
              color: AppColors.BaseColorMain,
            ),
          ),
        );
      }),
    );
  }
}
