import 'package:flutter/widgets.dart';
import '../resources/app_color.dart';

class ItemCategoryWidget extends StatelessWidget {
  const ItemCategoryWidget({
    Key? key,
    required this.Name,
  }) : super(key: key);
  final String Name;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.Name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.BaseColorWhite,
        fontSize: 16,
      ),
    );
  }
}
