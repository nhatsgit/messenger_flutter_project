import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: twoPageView(context)));
  }
}

Widget twoPageView(BuildContext context) {
  final ScrollController scrollController = ScrollController();
  const double containerHeight=400;
  return Column(
    children: [
      IconButton(
          onPressed: () {
            double currentPosition = scrollController.position.pixels;
            int currentIndex = (currentPosition / (containerHeight/2)).round(); 
            print('Current Index: $currentIndex');
            if (currentIndex > 0) {
              currentIndex--;
              scrollController.animateTo(
                (containerHeight / 2) * currentIndex,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
            }
          },
          icon: Icon(Icons.keyboard_arrow_up_rounded)),
      Container(
        width: 200,
        height: containerHeight,
        color: Colors.red,
        child: Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              controller: scrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: containerHeight/2,
                  color: index % 2 == 0 ? Colors.blue : Colors.green,
                  child: Center(
                    child: Text(
                      'Page $index',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      IconButton(
          onPressed: () {
            double currentPosition = scrollController.position.pixels;
            int currentIndex = (currentPosition / (containerHeight/2)).round(); 
            print('Current Index: $currentIndex');
            if (currentIndex < 10 - 1) {
              currentIndex++;
              scrollController.animateTo(
                (containerHeight/2) * currentIndex,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
            }
          },
          icon: Icon(Icons.keyboard_arrow_down_rounded)),
    ],
  );
}
