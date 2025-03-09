import 'package:drivr/widgets/pressable_card.dart';
import 'package:flutter/material.dart';

class HomeSliderCard extends StatelessWidget {
  final String title;
  final String cardValue;
  final VoidCallback? onPressed;
  final Color color;
  final Animation<double> heroAnimation;

  const HomeSliderCard(
      {super.key,
      required this.title,
      required this.cardValue,
      this.onPressed,
      required this.color,
      required this.heroAnimation});

  final TextStyle headerTextStyle =
      const TextStyle(color: Colors.white, fontSize: 16);
  final TextStyle cardTextStyle =
      const TextStyle(color: Colors.white, fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 8),
        child: PressableCard(
            color: color,
            onPressed: onPressed,
            flattenAnimation: heroAnimation,
            child: SizedBox(
                width: 140,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: headerTextStyle,
                        ),
                        Text(
                          cardValue,
                          style: cardTextStyle,
                        )
                      ],
                    )))));
  }
}
