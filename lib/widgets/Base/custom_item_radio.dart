import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/Base/custom_radio.dart';

class CustomItemRadio extends StatefulWidget {
  final String text;
  final String? image;
  late bool? isSelected;
  final VoidCallback? onPressed;

  CustomItemRadio({
    Key? key,
    required this.text,
    this.isSelected,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CustomItemRadio> createState() => _CustomItemRadioState();
}

class _CustomItemRadioState extends State<CustomItemRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected!;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            // Hiển thị hình ảnh nếu có
            if (widget.image != null) ...[
              CircleAvatar(
                  child: Image.asset(widget.image!, width: 40, height: 40)),
              const SizedBox(width: 8),
            ],
            // Hiển thị văn bản
            Text(
              widget.text,
              style: const TextStyle(
                  color: AppColors.BaseColorTextMain,
                  fontSize: Dimens.FontSizeCustomItemRadio,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            // Hiển thị CustomRadioButton
            CustomRadioButton(
              isSelected: widget.isSelected,
              onChanged: () {
                widget.onPressed;
              },
            ),
          ],
        ),
      ),
    );
  }
}
