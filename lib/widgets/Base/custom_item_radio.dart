import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:provider/provider.dart';

class CustomItemRadio extends StatefulWidget {
  final VoidCallback? onPressed;
  final List<ItemRadio> groupRadio;

  CustomItemRadio({
    Key? key,
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
    final data = Provider.of<ManagerAllWidget>(context);
    indexSelected = data.startModeTemp;
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
        itemCount: widget.groupRadio.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    data.changeStartModeTemp(index);
                  },
                  child: ItemRadioCustom(widget.groupRadio[index],
                      widget.groupRadio[index].isSelected!)),
              const SizedBox(height: 15),
              index < widget.groupRadio.length - 1
                  ? const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey,
                        height: 0.4,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
    );
  }

  Padding ItemRadioCustom(ItemRadio customRadioButton, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          // Hiển thị hình ảnh nếu có
          if (customRadioButton.img != null) ...[
            CircleAvatar(
                backgroundColor: Colors.transparent,
                child:
                    Image.asset(customRadioButton.img!, width: 40, height: 40)),
            const SizedBox(width: 10),
          ],
          //Hiển thị văn bản
          Text(
            customRadioButton.text!,
            style: TextStyle(
                color: isSelected
                    ? AppColors.BaseColorTextMain
                    : AppColors.BaseColorWhite,
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
                color: customRadioButton.isSelected!
                    ? AppColors.Border_Radio
                    : AppColors.BaseColorWhite, // Màu viền
                width: 2.0,
              ),
              color: Colors.transparent, // Màu nền
            ),
            child: customRadioButton.isSelected!
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
