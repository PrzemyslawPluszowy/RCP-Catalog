import 'package:flutter/material.dart';

class SailButtonWidget extends StatelessWidget {
  const SailButtonWidget({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.icon,
    required this.callback,
    required this.blendColorl,
    required this.boxShadowColor,
  }) : super(key: key);
  final String imageSrc;
  final String title;
  final IconData icon;
  final callback;
  final Color blendColorl;
  final Color boxShadowColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: callback,
      child: Stack(children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: boxShadowColor,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageSrc,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            height: 99,
            width: 149,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: blendColorl),
            child: Container()),
        SizedBox(
          height: 99,
          width: 149,
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 70,
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      )),
                  Icon(
                    icon,
                    size: 50,
                    color: Colors.white,
                  )
                ]),
          ),
        )
      ]),
    );
  }
}
