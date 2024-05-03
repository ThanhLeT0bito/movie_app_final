import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget widget;
  final String textButton;
  final VoidCallback onButtonPressed;

  const CustomBottomSheet({
    Key? key,
    required this.title,
    this.subTitle,
    required this.widget,
    required this.textButton,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ManagerAllWidget>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.BaseColorBlackGround,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: screenWidth / 3,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.BaseColorMain,
            ),
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  color: AppColors.BaseColorWhite,
                  fontSize: Dimens.FontSizeBottomSheetTitle,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: subTitle != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      subTitle!,
                      style: const TextStyle(
                          fontSize: Dimens.FontSizeBottomSheetSubTitle,
                          color: AppColors.BaseColorWhite),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(child: widget),
          ),
          CustomTextButton(
            onPressed: () {
              onButtonPressed();
            },
            text: textButton,
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

class CustomBottomSheetReview extends StatelessWidget {
  final String img;
  final String? name;
  final String time;
  final String title;
  final VoidCallback onButtonPressed;

  const CustomBottomSheetReview({
    Key? key,
    required this.img,
    this.name,
    required this.time,
    required this.title,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ManagerAllWidget>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.BaseColorBlackGround,
      height: MediaQuery.of(context).size.height * 0.6,
      width: screenWidth,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          alignment: Alignment.center,
          width: screenWidth / 3,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColors.BaseColorMain,
          ),
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: Dimens.FontSizeBottomSheetTitle,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              color: AppColors.BaseColorWhite,
              size: 35,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name!,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          time!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
