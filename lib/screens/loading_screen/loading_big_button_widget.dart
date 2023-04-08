import 'package:flutter/material.dart';

import '../main_screen/main_bottombar_screen.dart';

class LoadingBigButton extends StatefulWidget {
  const LoadingBigButton({
    super.key,
  });

  @override
  State<LoadingBigButton> createState() => _LoadingBigButtonState();
}

class _LoadingBigButtonState extends State<LoadingBigButton>
    with TickerProviderStateMixin {
  bool _animStop = true;

  late final AnimationController _controller = AnimationController(
    lowerBound: 0,
    upperBound: 1,
    value: 1,
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      _controller.stop();
    });
    super.initState();
  }

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(MainScreenBootomBar.pageRoute);
        },
        child: Center(
          child: Stack(alignment: Alignment.center, children: [
            SizedBox(
              width: 160,
              height: 160,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: Container(
                      color: const Color.fromARGB(135, 255, 255, 255))),
            ),
            SizedBox(
              width: 130,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      child: Image.asset(
                        'assets/images/turbo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 24,
                        width: double.maxFinite,
                        color: const Color.fromARGB(135, 255, 255, 255),
                        child: const Center(
                          child: Text('Click To Enter',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
