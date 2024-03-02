import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

import '../../resources/dimens.dart';

class CustomTextField extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final bool isNumber;

  const CustomTextField({
    Key? key,
    this.icon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.isNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        size: Dimens.FontSizeAppBar,
                        color: AppColors.BaseColorWhite,
                      )
                    : const SizedBox(),
                icon != null ? const SizedBox(width: 20) : const SizedBox(),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(
                        color: AppColors.BaseColorWhite,
                        fontSize: Dimens.FontSizeTextField),
                    obscureText: obscureText,
                    keyboardType:
                        isNumber ? TextInputType.number : TextInputType.text,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        color: AppColors.BaseColorWhite,
                        fontSize: Dimens.FontSizeTextField,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.BaseColorWhite,
          ),
        ],
      ),
    );
  }
}
