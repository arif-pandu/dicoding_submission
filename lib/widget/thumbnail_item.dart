import 'package:dicoding_submission/const/color.dart';
import 'package:flutter/material.dart';

class ItemThumb extends StatelessWidget {
  const ItemThumb({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      height: height * 0.2,
      width: width,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withOpacity(0.5),
            offset: Offset(3, 3),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
