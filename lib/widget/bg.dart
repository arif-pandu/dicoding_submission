import 'dart:math';

import 'package:dicoding_submission/const/color.dart';
import 'package:flutter/material.dart';

class BGApp extends StatelessWidget {
  const BGApp({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final Color _color1 = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    final Color _color2 = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    return Container(
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
                color: Colors.grey.withOpacity(0.1),
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
                color: _color2,
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
                color: _color1,
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
                color: _color1,
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
                color: _color2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
