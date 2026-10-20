import 'package:flutter/material.dart';
import '../data/pin_data.dart';
import 'pin_card.dart';

class MasonryGrid extends StatelessWidget {
  final List<Pin> items;
  final String heroPrefix;

  const MasonryGrid({super.key, required this.items, required this.heroPrefix});

  @override
  Widget build(BuildContext context) {
    final left = <Widget>[];
    final right = <Widget>[];
    var leftHeight = 0.0;
    var rightHeight = 0.0;

    for (final pin in items) {
      final card = PinCard(pin: pin, heroPrefix: heroPrefix);
      final h = pin.ratio + 0.25;
      if (leftHeight <= rightHeight) {
        left.add(card);
        leftHeight += h;
      } else {
        right.add(card);
        rightHeight += h;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Column(children: left)),
          const SizedBox(width: 8),
          Expanded(child: Column(children: right)),
        ],
      ),
    );
  }
}
