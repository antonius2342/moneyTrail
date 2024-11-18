import 'package:flutter/material.dart';


class CarouselSliderComponent extends StatefulWidget {
  final List<Widget> cards;

  const CarouselSliderComponent({super.key, required this.cards});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderComponentState createState() => _CarouselSliderComponentState();
}

class _CarouselSliderComponentState extends State<CarouselSliderComponent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: widget.cards.length,
              controller: PageController(viewportFraction: 0.8),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return widget.cards[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.cards.length, (index) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  
                ),
              );
              
            }),
          ),
        ],
      ),
    );
  }
}
