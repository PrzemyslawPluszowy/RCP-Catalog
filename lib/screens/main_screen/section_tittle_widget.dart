import 'package:flutter/material.dart';

//

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
            ],
          ),
        ),
        const Divider(
          height: 5,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
