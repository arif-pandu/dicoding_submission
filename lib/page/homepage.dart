// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            leading: Text("Leading"),
            title: Text("Titke"),
            expandedHeight: height * 0.2,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: height * 0.2,
                    width: width,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
