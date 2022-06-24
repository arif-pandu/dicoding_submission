import 'dart:math';
import 'package:dicoding_submission/const/color.dart';
import 'package:flutter/material.dart';

class BGApp extends StatelessWidget {
  BGApp({
    Key? key,
    required this.height,
    required this.width,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
            top: height * 0.4,
            left: width * 0.2,
            child: Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: AppColor.greyColor.withOpacity(0.1),
                color: color2.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            top: -width * 0.2,
            right: width * 0.2,
            child: Container(
              height: width * 0.4,
              width: width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
            ),
          ),
          Positioned(
            top: -width * 0.15,
            right: -width * 0.2,
            child: Container(
              height: width * 0.5,
              width: width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color1,
              ),
            ),
          ),
          Positioned(
            bottom: -width * 0.15,
            left: -width * 0.2,
            child: Container(
              height: width * 0.5,
              width: width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color1,
              ),
            ),
          ),
          Positioned(
            bottom: -width * 0.1,
            left: width * 0.15,
            child: Container(
              height: width * 0.25,
              width: width * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
