import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({
    Key? key,
    required this.img,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String img;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 500,
        height: 100,
        decoration: BoxDecoration(
          color:Colors.grey.shade900,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.isSelected ? AppColors.BaseColorMain : Colors.grey.shade900,
            width: 2
          )
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(
                widget.img,
                width: 100,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
