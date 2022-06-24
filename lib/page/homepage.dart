// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/widget/thumbnail_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  Alignment alignTitle = Alignment.centerLeft;

  Future<void> changeAlignment() async {
    print("Alignment Changed!");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: height * 0.2,
            elevation: 5,
            titleSpacing: 0.0,
            stretch: true,
            stretchTriggerOffset: 50,
            onStretchTrigger: changeAlignment,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(
                top: 25,
                start: 20.0,
                bottom: 0.0,
                end: 20,
              ),
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              title: Center(
                child: Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: alignTitle,
                        child: Text("Cake Catalog"),
                      ),
                    ],
                  ),
                ),
              ),
              background: Container(
                child: Image.asset(
                  "assets/image/header_image.png",
                  fit: BoxFit.cover,
                ),
                // decoration: BoxDecoration(
                //   color: AppColor.orangeColor,
                //   image: DecorationImage(
                //     image: AssetImage(
                //       "assets/image/header_image.png",
                //     ),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...List.generate(
                  5,
                  (index) => ItemThumb(height: height, width: width),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
