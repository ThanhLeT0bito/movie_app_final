// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/item_category.dart';

import '../widgets/Base/custom_app_bar.dart';


class CategoryScreens extends StatefulWidget {
  static const routeName = '/category-list';

  const CategoryScreens({Key? key}) : super(key: key);

  @override
  State<CategoryScreens> createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyWidget(),);
  }
}

class BodyWidget extends StatelessWidget{
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemCategoryWidget> listCategory = [
      ItemCategoryWidget(Name: "Action"),
      ItemCategoryWidget(Name: "Adventure"),
      ItemCategoryWidget(Name: "Asian"),
      ItemCategoryWidget(Name: "Comedy"),
      ItemCategoryWidget(Name: "Crime"),
      ItemCategoryWidget(Name: "Dramatic"),
      ItemCategoryWidget(Name: "Family"),
      ItemCategoryWidget(Name: "History"),
      ItemCategoryWidget(Name: "Historical drama"),
      ItemCategoryWidget(Name: "Horror"),
      ItemCategoryWidget(Name: "Science fiction"),
      ItemCategoryWidget(Name: "War"),
      ItemCategoryWidget(Name: "Western"),
    ];

    return Container(
      color: AppColors.BaseColorBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Category"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listCategory.length,
              itemBuilder: (context, index) {
                // Trả về mỗi widget danh mục trong danh sách
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: listCategory[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}