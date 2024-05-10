import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static const String routeName = '/category-screen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> categories = [
    "Action",
    "Adventure",
    "Asian",
    "Comedy",
    "Crime",
    "Dramatic",
    "Family",
    "History",
    "Horror",
    "War",
    ""
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Category',
          ),
          Expanded(
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 35),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                            color: AppColors.BaseColorWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
