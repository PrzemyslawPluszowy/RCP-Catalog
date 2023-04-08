import 'package:flutter/material.dart';

class SailButtonWidget extends StatelessWidget {
  const SailButtonWidget({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.icon,
    this.callback,
  }) : super(key: key);
  final String imageSrc;
  final String title;
  final IconData icon;
  final callback;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          child: Material(
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 4)),
              width: 130,
              height: 130,
              child: Image.asset(
                imageSrc,
                fit: BoxFit.fill,
                color: const Color.fromARGB(112, 0, 0, 0),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0),
                gradient: const LinearGradient(
                    transform: GradientRotation(-45),
                    colors: [Colors.black, Color.fromARGB(255, 255, 17, 0)]),
              ),
              width: 130,
              height: 130,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            callback();
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black54)),
                width: 130,
                height: 130,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
