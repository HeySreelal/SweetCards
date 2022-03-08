import 'package:flutter/material.dart';

class DismissBackgroundWidget extends StatelessWidget {
  final String image;
  final String text;
  final MainAxisAlignment alignment;

  const DismissBackgroundWidget({
    Key? key,
    required this.image,
    required this.text,
    this.alignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            Image.asset(
              image,
              height: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
