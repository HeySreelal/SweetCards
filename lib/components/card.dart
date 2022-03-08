import 'package:flutter/material.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/utils/theme.dart';

import '../utils/date.dart';

class SweetCardView extends StatelessWidget {
  const SweetCardView({
    Key? key,
    required this.card,
  }) : super(key: key);

  final SweetCard card;

  @override
  Widget build(BuildContext context) {
    final Color color = SweetTheme.randomColor;

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        border: const Border(),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: SweetTheme.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  card.title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: color,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  card.icon.icon,
                  color: color,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              SweetDays.daysCount(card.date).toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "Days",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: Text(
              SweetDays.formatedDate(card.date),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
