// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class CustomRadioButton extends StatefulWidget {
  late bool? isSelected;
  final Color? color;
  final VoidCallback? onChanged;

  CustomRadioButton({
    Key? key,
    this.isSelected = false,
    this.color = AppColors.BaseColorBlackGround,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          if (widget.onChanged != null) widget.onChanged!();
        });
      },
      child: Container(
        width: Dimens.WidthHeightRadioAround,
        height: Dimens.WidthHeightRadioAround,
        padding: const EdgeInsets.all(Dimens.PaddingRadio),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _isSelected
                ? AppColors.Border_Radio
                : AppColors.BaseColorWhite, // Màu viền
            width: 2.0,
          ),
          color: Colors.transparent, // Màu nền
        ),
        child: _isSelected
            ? Container(
                alignment: Alignment.center,
                width: Dimens.WidthHeightRadioChild,
                height: Dimens.WidthHeightRadioChild,
                decoration: const BoxDecoration(
                    color: AppColors.BaseColorMain, shape: BoxShape.circle),
                child: const SizedBox(),
              )
            : null,
      ),
    );
  }
}
