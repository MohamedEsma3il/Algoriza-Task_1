import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shaered/commponent.dart';
import '../login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.body,
    required this.image,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/Credit assesment-amico.png',
      body: 'get food delivery to your \n doorstep asap',
      title: '7krava',
    ),
    BoardingModel(
      image: 'assets/images/Credit assesment-rafiki.png',
      body: 'Buy any food from your favourite resturant',
      title: '7krava',
    ),
    BoardingModel(
      image: 'assets/images/Finance leaders-amico.png',
      body: 'Choose what yoou need from \n our best offers',
      title: '7krava',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          //skip button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(width: 70.0,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.greenAccent,
              ) ,

              child: TextButton(
                onPressed: () {
                  navigateAndFinish(context, LoginScreen());
                },
                child: Text('skip',style: TextStyle(fontSize: 16.0,color: Colors.black87),),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    expansionFactor: 4.0,
                    spacing: 5.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${model.title}',
            style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: Image(image: AssetImage('${model.image}')),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight:FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );
}
