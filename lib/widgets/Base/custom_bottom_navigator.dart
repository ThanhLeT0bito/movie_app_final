import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/custom_item_bottom__bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomItemBottomBar> bottomNavBarItems;
  final Function(int) onItemTapped;
  final int selectedIndex;

  CustomBottomNavigationBar({
    required this.bottomNavBarItems,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.BaseColorBlackGround,
        boxShadow: [
          BoxShadow(
            //color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bottomNavBarItems
              .asMap()
              .entries
              .map(
                (entry) => TextButton(
                  onPressed: () => onItemTapped(entry.key),
                  child: entry.value,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
