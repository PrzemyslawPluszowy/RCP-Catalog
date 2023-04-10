import 'package:flutter/material.dart';

class RoundLogo extends StatelessWidget {
  const RoundLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Container(
          decoration: const BoxDecoration(
            gradient: SweepGradient(
                transform: GradientRotation(90),
                startAngle: 0.2,
                endAngle: 5.6,
                colors: [
                  Color.fromARGB(202, 244, 67, 54),
                  Color.fromARGB(192, 0, 0, 0)
                ]),
          ),
          width: 130,
          height: 130,
        ),
      ),
      const Center(
        child: Opacity(
          opacity: 0.4,
          child: Icon(
            Icons.email,
            size: 90,
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Container(
          decoration: const BoxDecoration(
              gradient:
                  SweepGradient(colors: [Colors.black87, Colors.black54])),
          width: 110,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    ]);
  }
}
