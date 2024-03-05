import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/Base/custom_radio.dart';

class CustomItemRadio extends StatefulWidget {
  //final String text;
  final String? image;
  //late bool? isSelected;
  final VoidCallback? onPressed;
  final List<CustomRadioButton> groupRadio;

  CustomItemRadio({
    Key? key,
    //required this.text,
    //this.isSelected,
    this.image,
    this.onPressed,
    required this.groupRadio,
  }) : super(key: key);

  @override
  State<CustomItemRadio> createState() => _CustomItemRadioState();
}

class _CustomItemRadioState extends State<CustomItemRadio> {
  @override
  void initState() {
    super.initState();
  }

  //bool _isSelected = false;
  int indexSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
        itemCount: widget.groupRadio.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSelected = index;
                      widget.groupRadio[index].isSelected = true;
                      for (var item in widget.groupRadio) {
                        widget.groupRadio[index].isSelected =
                            index == indexSelected;
                      }
                      print(indexSelected);
                    });
                  },
                  child: ItemRadio(
                      widget.groupRadio[index], indexSelected == index)),
              const SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }

  Padding ItemRadio(CustomRadioButton customRadioButton, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          // Hiển thị hình ảnh nếu có
          if (widget.image != null) ...[
            CircleAvatar(
                child: Image.asset(widget.image!, width: 40, height: 40)),
            const SizedBox(width: 8),
          ],
          //Hiển thị văn bản
          const Text(
            "hello",
            style: TextStyle(
                color: AppColors.BaseColorTextMain,
                fontSize: Dimens.FontSizeCustomItemRadio,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // Hiển thị CustomRadioButton
          Container(
            width: Dimens.WidthHeightRadioAround,
            height: Dimens.WidthHeightRadioAround,
            padding: const EdgeInsets.all(Dimens.PaddingRadio),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppColors.Border_Radio
                    : AppColors.BaseColorWhite, // Màu viền
                width: 2.0,
              ),
              color: Colors.transparent, // Màu nền
            ),
            child: isSelected
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
        ],
      ),
    );
  }
}
