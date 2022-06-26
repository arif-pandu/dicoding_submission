import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/const/text_style.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.cakeName,
    required this.cakePath,
    required this.cakePrice,
    required this.cakeRating,
    required this.cakeTag,
    required this.cakeKeyword,
    required this.cakeDescription,
  }) : super(key: key);

  final String cakeName;
  final String cakePath;
  final int cakePrice;
  final int cakeRating;
  final int cakeTag;
  final List cakeKeyword;
  final String cakeDescription;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //
  int cakeCart = 0;

  void _addCart() {
    setState(() {
      cakeCart++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main Header Cake Image
                //
                SizedBox(
                  height: height * 0.4,
                  width: width,
                  child: Image.asset(
                    widget.cakePath,
                    fit: BoxFit.cover,
                  ),
                ),
                // Informations About the Cake
                //
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cake Name
                      Text(
                        widget.cakeName,
                        style: AppTextStyle.styleTitle,
                      ),
                      // Rating
                      Padding(
                        padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                        child: Row(
                          children: [
                            ...List.generate(
                              widget.cakeRating.isOdd ? (widget.cakeRating + 1) ~/ 2 : widget.cakeRating ~/ 2,
                              (index) {
                                if (widget.cakeRating.isEven) {
                                  return const Icon(Icons.star_rounded);
                                } else {
                                  int _tempCount = (widget.cakeRating - 1) ~/ 2;
                                  if (index < _tempCount) {
                                    return const Icon(Icons.star_rounded);
                                  } else {
                                    return const Icon(Icons.star_half_rounded);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      // Price
                      Text(
                        "IDR " + widget.cakePrice.toString() + ".000",
                        style: AppTextStyle.styleSubTitle.copyWith(fontWeight: FontWeight.w400),
                      ),
                      // Cake's Keyword
                      Container(
                        height: 40,
                        width: width - 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.cakeKeyword.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.whiteColor, border: Border.all(width: 1, color: AppColor.blackColor)),
                                child: Text(
                                  widget.cakeKeyword[index],
                                  style: AppTextStyle.styleCommon.copyWith(fontSize: 14),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Description Paragraph
                      Text(
                        "\u0009\u0009" + widget.cakeDescription,
                        style: AppTextStyle.styleCommon.copyWith(
                          wordSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Check Price
                SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 80,
                        width: width - 80 - 30,
                        decoration: BoxDecoration(
                          color: AppColor.blackColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp.",
                              style: AppTextStyle.styleSubTitle.copyWith(color: AppColor.whiteColor),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: width * 0.3,
                              child: Text(
                                (widget.cakePrice * cakeCart * 1000).toString(),
                                style: AppTextStyle.styleSubTitle.copyWith(color: AppColor.whiteColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "x ($cakeCart)",
                              style: AppTextStyle.styleSubTitle.copyWith(color: AppColor.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _addCart();
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.blackColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add_shopping_cart_rounded,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.blackColor.withOpacity(0.4)),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColor.whiteColor,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
